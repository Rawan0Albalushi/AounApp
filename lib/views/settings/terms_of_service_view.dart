import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';

class TermsOfServiceView extends StatelessWidget {
  const TermsOfServiceView({super.key});

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
                          title: l10n.settingsTermsOfService,
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
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                l10n.termsOfServiceContent,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      height: 1.55,
                                      color: scheme.onSurface
                                          .withValues(alpha: 0.88),
                                    ),
                              ),
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
