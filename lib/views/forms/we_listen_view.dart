import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';
import '../../widgets/haptic_button.dart';

class WeListenView extends StatefulWidget {
  const WeListenView({super.key});

  @override
  State<WeListenView> createState() => _WeListenViewState();
}

class _WeListenViewState extends State<WeListenView> {
  final _formKey = GlobalKey<FormState>();
  final _message = TextEditingController();
  String _priority = 'medium';
  String? _category;

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  void _submit(AppLocalizations l10n) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.weListenSubmitSuccess),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

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
                          title: l10n.weListenTitle,
                          subtitle: l10n.weListenSubtitle,
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
                                          color: AppColors.royalGold
                                              .withValues(alpha: 0.14),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.headset_mic_rounded,
                                            color: AppColors.navy,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Text(
                                          l10n.weListenIntro,
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
                                        DropdownButtonFormField<String>(
                                          value: _category, // ignore: deprecated_member_use
                                          decoration: InputDecoration(
                                            labelText: l10n.feedbackCategory,
                                            filled: true,
                                          ),
                                          items: [
                                            for (final c
                                                in DemoData.feedbackCategories)
                                              DropdownMenuItem(
                                                value: c.$1,
                                                child: Text(
                                                  isAr ? c.$3 : c.$2,
                                                ),
                                              ),
                                          ],
                                          onChanged: (v) =>
                                              setState(() => _category = v),
                                          validator: (v) => v == null
                                              ? l10n.validationRequired
                                              : null,
                                        ),
                                        const SizedBox(height: 20),
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
                                              label:
                                                  Text(l10n.priorityMedium),
                                            ),
                                            ButtonSegment(
                                              value: 'high',
                                              label: Text(l10n.priorityHigh),
                                            ),
                                          ],
                                          selected: {_priority},
                                          onSelectionChanged: (s) {
                                            setState(
                                                () => _priority = s.first);
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        TextFormField(
                                          controller: _message,
                                          minLines: 5,
                                          maxLines: 10,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          decoration: InputDecoration(
                                            labelText: l10n.feedbackMessage,
                                            hintText: l10n.feedbackMessageHint,
                                            alignLabelWithHint: true,
                                            filled: true,
                                          ),
                                          validator: (v) =>
                                              (v == null || v.trim().isEmpty)
                                                  ? l10n.validationRequired
                                                  : null,
                                        ),
                                        const SizedBox(height: 24),
                                        HapticFilledButton(
                                          onPressed: () => _submit(l10n),
                                          child: Text(l10n.commonSubmit),
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
