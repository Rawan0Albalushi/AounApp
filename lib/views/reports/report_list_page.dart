import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../models/report_item.dart';
import '../../widgets/empty_state.dart';
import '../../widgets/haptic_button.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';
import '../../widgets/status_tag.dart';

class ReportListPage extends StatefulWidget {
  const ReportListPage({
    super.key,
    required this.title,
    required this.items,
    this.heroSubtitle,
    this.emptyIcon = Icons.description_outlined,
  });

  final String title;

  /// When null, [AppLocalizations.reportsListSubtitle] is used.
  final String? heroSubtitle;
  final List<ReportItem> items;
  final IconData emptyIcon;

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage> {
  DateTimeRange? _range;

  Future<void> _pickRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 1),
      initialDateRange:
          _range ??
          DateTimeRange(
            start: now.subtract(const Duration(days: 30)),
            end: now,
          ),
    );
    if (picked != null) setState(() => _range = picked);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    final pageInsets = pagePadding(context);
    final maxW = contentMaxWidth(context);
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
                          title: widget.title,
                          subtitle:
                              widget.heroSubtitle ?? l10n.reportsListSubtitle,
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
                                                _range == null
                                                    ? l10n.selectDateRange
                                                    : '${_range!.start.toIso8601String().split('T').first} → ${_range!.end.toIso8601String().split('T').first}',
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
                              const SizedBox(height: 20),
                              if (widget.items.isEmpty)
                                SizedBox(
                                  height: constraints.maxHeight * 0.45,
                                  child: EmptyState(icon: widget.emptyIcon),
                                )
                              else
                                ...widget.items.map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: _ReportRow(item: e, l10n: l10n),
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

class _ReportRow extends StatelessWidget {
  const _ReportRow({required this.item, required this.l10n});

  final ReportItem item;
  final AppLocalizations l10n;

  StatusKind _kind(int i) {
    final kinds = [
      StatusKind.completed,
      StatusKind.pending,
      StatusKind.earlyExit,
      StatusKind.approved,
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
    final scheme = Theme.of(context).colorScheme;
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final hash = item.title.hashCode.abs();
    final kind = _kind(hash % 4);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                StatusTag(label: _label(l10n, kind), kind: kind),
              ],
            ),
            const SizedBox(height: 14),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: HapticFilledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        '${l10n.commonDownloadPdf}: ${item.localizedTitle(isAr)}',
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(0, 40),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.picture_as_pdf_outlined, size: 18),
                    const SizedBox(width: 8),
                    Text(l10n.commonDownloadPdf),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
