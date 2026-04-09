import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final pageInsets = pagePadding(context);
    final maxW = contentMaxWidth(context);
    final titleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: scheme.primary,
    );
    final bodyStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
      height: 1.55,
      color: scheme.onSurface.withValues(alpha: 0.88),
    );

    Widget section(String title, String body) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            const SizedBox(height: 8),
            Text(body, style: bodyStyle),
          ],
        ),
      );
    }

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
                          title: l10n.settingsAboutUs,
                          subtitle: l10n.aboutUsSubtitle,
                          leading: IconButton(
                            icon: const Icon(Icons.arrow_back_rounded),
                            color: Colors.white,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: kCorporateHeroBodyTopSpacing,
                              ),
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        l10n.aboutUsIntro,
                                        style: bodyStyle?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              (bodyStyle.fontSize ?? 16) + 1,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Divider(
                                        height: 1,
                                        color: scheme.outlineVariant.withValues(
                                          alpha: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      section(
                                        l10n.aboutUsWhoWeAreTitle,
                                        l10n.aboutUsWhoWeAreBody,
                                      ),
                                      section(
                                        l10n.aboutUsMissionTitle,
                                        l10n.aboutUsMissionBody,
                                      ),
                                      section(
                                        l10n.aboutUsVisionTitle,
                                        l10n.aboutUsVisionBody,
                                      ),
                                      section(
                                        l10n.aboutUsOfferTitle,
                                        l10n.aboutUsOfferBody,
                                      ),
                                      section(
                                        l10n.aboutUsValuesTitle,
                                        l10n.aboutUsValuesBody,
                                      ),
                                      section(
                                        l10n.aboutUsPrivacyTitle,
                                        l10n.aboutUsPrivacyBody,
                                      ),
                                      section(
                                        l10n.aboutUsSupportTitle,
                                        l10n.aboutUsSupportBody,
                                      ),
                                      Text(
                                        l10n.aboutUsFooterNote,
                                        style: bodyStyle?.copyWith(
                                          fontSize:
                                              (bodyStyle.fontSize ?? 16) - 1,
                                          color: scheme.onSurface.withValues(
                                            alpha: 0.62,
                                          ),
                                        ),
                                      ),
                                    ],
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
