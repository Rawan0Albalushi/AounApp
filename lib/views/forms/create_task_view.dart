import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

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
                          title: l10n.createTaskTitle,
                        ),
                        CorporateHeroOverlap(
                          padding: EdgeInsets.fromLTRB(
                            pageInsets.left,
                            0,
                            pageInsets.right,
                            0,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                DropdownButtonFormField<String>(
                        value: _employee, // ignore: deprecated_member_use
                        decoration: InputDecoration(
                          labelText: l10n.assignTo,
                        ),
                        items: [
                          for (final e in DemoData.employees)
                            DropdownMenuItem(
                              value: e.$1,
                              child: Text(
                                '${isAr ? e.$3 : e.$2} · ${isAr ? e.$5 : e.$4}',
                              ),
                            ),
                        ],
                        onChanged: (v) => setState(() => _employee = v),
                        validator: (v) =>
                            v == null ? l10n.validationRequired : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _details,
                        minLines: 4,
                        maxLines: 8,
                        decoration: InputDecoration(
                          labelText: l10n.taskDetails,
                          alignLabelWithHint: true,
                        ),
                        validator: (v) =>
                            (v == null || v.trim().isEmpty)
                                ? l10n.validationRequired
                                : null,
                      ),
                      const SizedBox(height: 16),
                      Text(l10n.priority,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 8),
                      SegmentedButton<String>(
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
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Text(l10n.commonSubmit),
                                ),
                              ],
                            ),
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
