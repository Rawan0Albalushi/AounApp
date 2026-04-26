import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../features/tasks/presentation/providers/task_provider.dart';
import '../../l10n/app_localizations.dart';
import '../../models/demo_task_item.dart';
import '../../models/report_item.dart';
import '../../shared/widgets/async_state_view.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';
import '../../widgets/haptic_button.dart';
import '../../widgets/status_tag.dart';

bool _dateInRange(DateTime d, DateTimeRange range) {
  final day = DateTime(d.year, d.month, d.day);
  final start = DateTime(range.start.year, range.start.month, range.start.day);
  final end = DateTime(range.end.year, range.end.month, range.end.day);
  return !day.isBefore(start) && !day.isAfter(end);
}

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  late DateTimeRange _range;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    _range = DateTimeRange(
      start: today.subtract(const Duration(days: 30)),
      end: today,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TaskProvider>().loadTasks();
      }
    });
  }

  Future<void> _pickRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 1),
      initialDateRange: _range,
    );
    if (picked != null) setState(() => _range = picked);
  }

  List<ReportItem> _filteredItems(List<DemoTaskItem> source) => source
      .where((e) => _dateInRange(e.referenceDate, _range))
      .map((e) => e.item)
      .toList();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final pageInsets = pagePadding(context);
    final maxW = contentMaxWidth(context);
    final tasks = context.watch<TaskProvider>();
    final items = _filteredItems(tasks.tasks);

    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: AppShellBackdrop(
        child: SafeArea(
          top: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: pageInsets.bottom),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxW),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CorporateHeroHeader(
                          title: l10n.taskDetails,
                          subtitle: l10n.taskListHeroSubtitle,
                        ),
                        CorporateHeroOverlap(
                          padding: EdgeInsets.fromLTRB(
                            pageInsets.left,
                            0,
                            pageInsets.right,
                            0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(
                                height: kCorporateHeroBodyTopSpacing,
                              ),
                              const SizedBox(height: 20),
                              Material(
                                color: scheme.surface,
                                borderRadius: BorderRadius.circular(16),
                                child: InkWell(
                                  onTap: _pickRange,
                                  borderRadius: BorderRadius.circular(16),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.date_range_rounded,
                                          color: scheme.primary,
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                l10n.dateRange,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium
                                                    ?.copyWith(
                                                      color: scheme.onSurface
                                                          .withValues(
                                                            alpha: 0.6,
                                                          ),
                                                    ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                '${_range.start.toIso8601String().split('T').first} → ${_range.end.toIso8601String().split('T').first}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Icon(
                                          Directionality.of(context) ==
                                                  TextDirection.rtl
                                              ? Icons.chevron_left
                                              : Icons.chevron_right,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              HapticFilledButton(
                                onPressed: () => Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.formTask),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.add_task_rounded,
                                      size: 22,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(l10n.taskListCreateNew),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              AsyncStateView(
                                isLoading: tasks.isLoading,
                                hasError: tasks.hasError,
                                isEmpty: items.isEmpty,
                                emptyIcon: Icons.assignment_turned_in_outlined,
                                onRetry: () =>
                                    context.read<TaskProvider>().loadTasks(),
                                child: Column(
                                  children: [
                                    for (final e in items)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                        child: _TaskRowCard(item: e),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TaskRowCard extends StatelessWidget {
  const _TaskRowCard({required this.item});

  final ReportItem item;

  StatusKind _kind(int i) {
    const kinds = [
      StatusKind.completed,
      StatusKind.pending,
      StatusKind.approved,
      StatusKind.pending,
    ];
    return kinds[i % kinds.length];
  }

  String _label(AppLocalizations l10n, StatusKind k) {
    switch (k) {
      case StatusKind.completed:
        return l10n.statusCompleted;
      case StatusKind.pending:
        return l10n.statusPending;
      case StatusKind.earlyExit:
        return l10n.statusEarlyExit;
      case StatusKind.approved:
        return l10n.statusApproved;
      case StatusKind.rejected:
        return l10n.statusRejected;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final hash = item.title.hashCode.abs();
    final kind = _kind(hash % 4);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.localizedTitle(isAr),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.localizedSubtitle(isAr),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: scheme.onSurface.withValues(alpha: 0.65),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.localizedDateLabel(isAr),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            StatusTag(label: _label(l10n, kind), kind: kind),
          ],
        ),
      ),
    );
  }
}
