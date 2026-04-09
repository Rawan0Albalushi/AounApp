import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/haptic_utils.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../models/approval_item.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_app_bar.dart';
import '../../widgets/haptic_button.dart';

class ApprovalDetailView extends StatelessWidget {
  const ApprovalDetailView({
    super.key,
    required this.detailTitle,
    required this.item,
  });

  final String detailTitle;
  final ApprovalItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: buildCorporateAppBar(context, title: detailTitle),
      body: AppShellBackdrop(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxW = contentMaxWidth(context);
            final pad = pagePadding(context);
            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxW),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: pad,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.localizedTitle(isAr),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  item.localizedSubtitle(isAr),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: scheme.onSurface
                                            .withValues(alpha: 0.7),
                                      ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '${l10n.labelReferenceShort}: ${item.id}',
                                  style:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  l10n.approvalDetailNarrative(item.id),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        height: 1.45,
                                        color: scheme.onSurface
                                            .withValues(alpha: 0.85),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                      top: false,
                      child: Padding(
                        padding: pad.copyWith(top: 8),
                        child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 52,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: scheme.error,
                                  foregroundColor: scheme.onError,
                                ),
                                onPressed: () {
                                  lightImpact();
                                  Navigator.of(context).pop();
                                },
                                child: Text(l10n.commonReject),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: SizedBox(
                              height: 52,
                              child: HapticFilledButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.royalGold,
                                  foregroundColor: Colors.white,
                                ),
                                child: Text(l10n.commonApprove),
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
            );
          },
        ),
      ),
    );
  }
}
