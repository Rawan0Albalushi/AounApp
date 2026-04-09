import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';
import '../../widgets/haptic_button.dart';

class CreateAnnouncementView extends StatefulWidget {
  const CreateAnnouncementView({super.key});

  @override
  State<CreateAnnouncementView> createState() => _CreateAnnouncementViewState();
}

class _CreateAnnouncementViewState extends State<CreateAnnouncementView> {
  final _formKey = GlobalKey<FormState>();
  final _titleEn = TextEditingController();
  final _titleAr = TextEditingController();
  final _bodyEn = TextEditingController();
  final _bodyAr = TextEditingController();

  @override
  void initState() {
    super.initState();
    final sample = DemoData.announcements.first;
    _titleEn.text = sample.title;
    _titleAr.text = sample.titleAr ?? sample.title;
    _bodyEn.text = sample.bodyEn;
    _bodyAr.text = sample.bodyAr;
  }

  @override
  void dispose() {
    _titleEn.dispose();
    _titleAr.dispose();
    _bodyEn.dispose();
    _bodyAr.dispose();
    super.dispose();
  }

  void _submit(AppLocalizations l10n) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.createAnnouncementSubmitSuccess),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
                          title: l10n.createAnnouncement,
                          subtitle: l10n.createAnnouncementSubtitle,
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
                                          color: AppColors.royalGold
                                              .withValues(alpha: 0.14),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                            Icons.campaign_outlined,
                                            color: AppColors.navy,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Text(
                                          l10n.createAnnouncementIntro,
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
                                        TextFormField(
                                          controller: _titleEn,
                                          decoration: InputDecoration(
                                            labelText: l10n.announcementTitleEn,
                                            filled: true,
                                          ),
                                          validator: (v) =>
                                              (v == null || v.trim().isEmpty)
                                                  ? l10n.validationRequired
                                                  : null,
                                        ),
                                        const SizedBox(height: 12),
                                        TextFormField(
                                          controller: _titleAr,
                                          decoration: InputDecoration(
                                            labelText: l10n.announcementTitleAr,
                                            filled: true,
                                          ),
                                          validator: (v) =>
                                              (v == null || v.trim().isEmpty)
                                                  ? l10n.validationRequired
                                                  : null,
                                        ),
                                        const SizedBox(height: 16),
                                        TextFormField(
                                          controller: _bodyEn,
                                          minLines: 3,
                                          maxLines: 6,
                                          decoration: InputDecoration(
                                            labelText: l10n.announcementBodyEn,
                                            alignLabelWithHint: true,
                                            filled: true,
                                          ),
                                          validator: (v) =>
                                              (v == null || v.trim().isEmpty)
                                                  ? l10n.validationRequired
                                                  : null,
                                        ),
                                        const SizedBox(height: 12),
                                        TextFormField(
                                          controller: _bodyAr,
                                          minLines: 3,
                                          maxLines: 6,
                                          decoration: InputDecoration(
                                            labelText: l10n.announcementBodyAr,
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
