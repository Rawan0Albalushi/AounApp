import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';
import '../../widgets/haptic_button.dart';

class LeaveRequestView extends StatefulWidget {
  const LeaveRequestView({super.key});

  @override
  State<LeaveRequestView> createState() => _LeaveRequestViewState();
}

class _LeaveRequestViewState extends State<LeaveRequestView> {
  final _formKey = GlobalKey<FormState>();
  String? _type;
  DateTime? _start;
  DateTime? _end;
  String? _attachmentName;

  void _submit(AppLocalizations l10n) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.leaveRequestSubmitSuccess),
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
                          title: l10n.leaveRequestTitle,
                          subtitle: l10n.leaveRequestSubtitle,
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
                                            Icons.account_balance_wallet_outlined,
                                            color: AppColors.navy,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              l10n.leaveBalance,
                                              style: theme.textTheme.labelMedium,
                                            ),
                                            Text(
                                              '${DemoData.leaveBalanceDays}',
                                              style: theme.textTheme.titleMedium
                                                  ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              l10n.leaveBalanceBreakdown,
                                              style: theme.textTheme.bodySmall
                                                  ?.copyWith(
                                                color: scheme.onSurface
                                                    .withValues(alpha: 0.6),
                                              ),
                                            ),
                                          ],
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
                                        Row(
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
                                                  Icons.event_available_outlined,
                                                  color: AppColors.navy,
                                                  size: 26,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 14),
                                            Expanded(
                                              child: Text(
                                                l10n.leaveRequestIntro,
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
                                        const SizedBox(height: 20),
                                        DropdownButtonFormField<String>(
                                          value: _type, // ignore: deprecated_member_use
                                          decoration: InputDecoration(
                                            labelText: l10n.leaveType,
                                            filled: true,
                                          ),
                                          items: [
                                            for (final t in DemoData.leaveTypes)
                                              DropdownMenuItem(
                                                value: t.$1,
                                                child: Text(
                                                  isAr ? t.$3 : t.$2,
                                                ),
                                              ),
                                          ],
                                          onChanged: (v) =>
                                              setState(() => _type = v),
                                          validator: (v) => v == null
                                              ? l10n.validationRequired
                                              : null,
                                        ),
                                        const SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: OutlinedButton.icon(
                                                onPressed: () async {
                                                  final d =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: _start ??
                                                        DateTime.now(),
                                                    firstDate: DateTime.now()
                                                        .subtract(
                                                      const Duration(days: 365),
                                                    ),
                                                    lastDate: DateTime.now().add(
                                                      const Duration(days: 365),
                                                    ),
                                                  );
                                                  if (d != null) {
                                                    setState(() => _start = d);
                                                  }
                                                },
                                                icon: const Icon(
                                                  Icons.date_range,
                                                ),
                                                label: Text(
                                                  _start == null
                                                      ? l10n.fieldDateStart
                                                      : _start!
                                                          .toIso8601String()
                                                          .split('T')
                                                          .first,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: OutlinedButton.icon(
                                                onPressed: () async {
                                                  final d =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: _end ??
                                                        DateTime.now(),
                                                    firstDate: DateTime.now()
                                                        .subtract(
                                                      const Duration(days: 365),
                                                    ),
                                                    lastDate: DateTime.now().add(
                                                      const Duration(days: 365),
                                                    ),
                                                  );
                                                  if (d != null) {
                                                    setState(() => _end = d);
                                                  }
                                                },
                                                icon: const Icon(
                                                  Icons.date_range,
                                                ),
                                                label: Text(
                                                  _end == null
                                                      ? l10n.fieldDateEnd
                                                      : _end!
                                                          .toIso8601String()
                                                          .split('T')
                                                          .first,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        OutlinedButton.icon(
                                          onPressed: () {
                                            setState(
                                              () => _attachmentName =
                                                  l10n.demoAttachmentPdf,
                                            );
                                          },
                                          icon: const Icon(Icons.attach_file),
                                          label: Text(
                                            _attachmentName ?? l10n.pickFile,
                                          ),
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
