import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_app_bar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: buildCorporateAppBar(
        context,
        title: l10n.settingsAboutUs,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
      ),
      body: AppShellBackdrop(
        child: LayoutBuilder(
        builder: (context, constraints) {
          final maxW = contentMaxWidth(context);
          return Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: pagePadding(context),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxW),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      l10n.aboutUsContent,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.55,
                            color: scheme.onSurface.withValues(alpha: 0.88),
                          ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        ),
      ),
    );
  }
}
