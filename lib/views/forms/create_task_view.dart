import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../features/tasks/presentation/providers/task_provider.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';
import '../../widgets/haptic_button.dart';

class CreateTaskView extends StatefulWidget {
  const CreateTaskView({super.key});

  @override
  State<CreateTaskView> createState() => _CreateTaskViewState();
}

class _CreateTaskViewState extends State<CreateTaskView> {
  final _formKey = GlobalKey<FormState>();
  final _details = TextEditingController();
  String? _employee;
  String _priority = 'medium';
  bool _seededSampleText = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_seededSampleText) {
      _seededSampleText = true;
      _details.text = AppLocalizations.of(context).demoSampleTaskBody;
    }
  }

  @override
  void dispose() {
    _details.dispose();
    super.dispose();
  }

  Future<void> _submit(AppLocalizations l10n) async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final ok = await context.read<TaskProvider>().createTask(
      assigneeId: _employee!,
      details: _details.text,
      priority: _priority,
    );
    if (!mounted) return;
    if (ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.createTaskSubmitSuccess),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        ),
      );
      Navigator.of(context).pop();
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          context.read<TaskProvider>().errorMessage ?? l10n.commonRetry,
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      ),
    );
  }

  (String, String, String, String, String)? _employeeById(String? id) {
    if (id == null) return null;
    for (final employee in DemoData.employees) {
      if (employee.$1 == id) return employee;
    }
    return null;
  }

  Future<String?> _showEmployeePicker({
    required bool isAr,
    required ThemeData theme,
    required ColorScheme scheme,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 520),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
                  child: Text(
                    AppLocalizations.of(context).assignTo,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                for (final e in DemoData.employees)
                  ListTile(
                    title: Text(
                      isAr ? e.$3 : e.$2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      isAr ? e.$5 : e.$4,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: _employee == e.$1
                        ? const Icon(Icons.check_circle, color: AppColors.navy)
                        : Icon(
                            Icons.circle_outlined,
                            color: scheme.onSurface.withValues(alpha: 0.4),
                          ),
                    onTap: () => Navigator.of(context).pop(e.$1),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final tasks = context.watch<TaskProvider>();
    final employee = _employeeById(_employee);
    final selectedEmployeeName = employee == null
        ? null
        : (isAr ? employee.$3 : employee.$2);
    final selectedEmployeeDept = employee == null
        ? null
        : (isAr ? employee.$5 : employee.$4);

    final pageInsets = pagePadding(context);
    final maxW = contentMaxWidth(context);
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      resizeToAvoidBottomInset: true,
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
                          title: l10n.createTaskTitle,
                          subtitle: l10n.createTaskSubtitle,
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
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: AppColors.royalGold.withValues(
                                            alpha: 0.14,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.task_alt_outlined,
                                            color: AppColors.navy,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Text(
                                          l10n.createTaskIntro,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                height: 1.45,
                                                color: scheme.onSurface
                                                    .withValues(alpha: 0.88),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        FormField<String>(
                                          initialValue: _employee,
                                          validator: (v) => (v ?? _employee) == null
                                              ? l10n.validationRequired
                                              : null,
                                          builder: (field) {
                                            return InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () async {
                                                final selected =
                                                    await _showEmployeePicker(
                                                      isAr: isAr,
                                                      theme: theme,
                                                      scheme: scheme,
                                                    );
                                                if (selected == null) return;
                                                setState(
                                                  () => _employee = selected,
                                                );
                                                field.didChange(selected);
                                                field.validate();
                                              },
                                              child: InputDecorator(
                                                isEmpty:
                                                    selectedEmployeeName == null,
                                                decoration: InputDecoration(
                                                  labelText: l10n.assignTo,
                                                  filled: true,
                                                  errorText: field.errorText,
                                                  suffixIcon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                  ),
                                                ),
                                                child:
                                                    selectedEmployeeName == null
                                                    ? null
                                                    : Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            selectedEmployeeName,
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          if (selectedEmployeeDept !=
                                                              null)
                                                            Text(
                                                              selectedEmployeeDept,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: theme
                                                                  .textTheme
                                                                  .bodySmall
                                                                  ?.copyWith(
                                                                    color: scheme
                                                                        .onSurface
                                                                        .withValues(
                                                                          alpha:
                                                                              0.7,
                                                                        ),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          controller: _details,
                                          minLines: 4,
                                          maxLines: 8,
                                          decoration: InputDecoration(
                                            labelText: l10n.taskDetails,
                                            alignLabelWithHint: true,
                                            filled: true,
                                          ),
                                          validator: (v) =>
                                              (v == null || v.trim().isEmpty)
                                              ? l10n.validationRequired
                                              : null,
                                        ),
                                        const SizedBox(height: 16),
                                        Text(
                                          l10n.priority,
                                          style: theme.textTheme.titleSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        const SizedBox(height: 10),
                                        SegmentedButton<String>(
                                          showSelectedIcon: false,
                                          segments: [
                                            ButtonSegment(
                                              value: 'low',
                                              label: Text(l10n.priorityLow),
                                            ),
                                            ButtonSegment(
                                              value: 'medium',
                                              label: Text(l10n.priorityMedium),
                                            ),
                                            ButtonSegment(
                                              value: 'high',
                                              label: Text(l10n.priorityHigh),
                                            ),
                                          ],
                                          selected: {_priority},
                                          onSelectionChanged: (s) {
                                            setState(() => _priority = s.first);
                                          },
                                        ),
                                        const SizedBox(height: 24),
                                        HapticFilledButton(
                                          onPressed: tasks.isSaving
                                              ? null
                                              : () => _submit(l10n),
                                          child: tasks.isSaving
                                              ? const SizedBox(
                                                  height: 18,
                                                  width: 18,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                      ),
                                                )
                                              : Text(l10n.commonSubmit),
                                        ),
                                      ],
                                    ),
                                  ),
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
