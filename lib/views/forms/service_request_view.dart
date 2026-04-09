import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_hero_header.dart';
import '../../widgets/haptic_button.dart';

class ServiceRequestView extends StatefulWidget {
  const ServiceRequestView({super.key});

  @override
  State<ServiceRequestView> createState() => _ServiceRequestViewState();
}

class _ServiceRequestViewState extends State<ServiceRequestView> {
  final _formKey = GlobalKey<FormState>();
  final _details = TextEditingController();
  String? _serviceType;
  String? _delivery;
  DateTime? _neededBy;

  @override
  void initState() {
    super.initState();
    _serviceType = DemoData.serviceTypes.first.$1;
    _delivery = DemoData.deliveryMethods.first.$1;
  }

  @override
  void dispose() {
    _details.dispose();
    super.dispose();
  }

  void _submit(AppLocalizations l10n) {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.serviceRequestSubmitSuccess),
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
                          title: l10n.serviceRequestTitle,
                          subtitle: l10n.serviceRequestSubtitle,
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
                                            Icons.description_outlined,
                                            color: AppColors.navy,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      Expanded(
                                        child: Text(
                                          l10n.serviceRequestIntro,
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
                                          value: _serviceType, // ignore: deprecated_member_use
                                          decoration: InputDecoration(
                                            labelText: l10n.serviceType,
                                            filled: true,
                                          ),
                                          items: [
                                            for (final s
                                                in DemoData.serviceTypes)
                                              DropdownMenuItem(
                                                value: s.$1,
                                                child: Text(
                                                  isAr ? s.$3 : s.$2,
                                                ),
                                              ),
                                          ],
                                          onChanged: (v) =>
                                              setState(() => _serviceType = v),
                                          validator: (v) => v == null
                                              ? l10n.validationRequired
                                              : null,
                                        ),
                                        const SizedBox(height: 16),
                                        DropdownButtonFormField<String>(
                                          value: _delivery, // ignore: deprecated_member_use
                                          decoration: InputDecoration(
                                            labelText: l10n.deliveryMethod,
                                            filled: true,
                                          ),
                                          items: [
                                            for (final d
                                                in DemoData.deliveryMethods)
                                              DropdownMenuItem(
                                                value: d.$1,
                                                child: Text(
                                                  isAr ? d.$3 : d.$2,
                                                ),
                                              ),
                                          ],
                                          onChanged: (v) =>
                                              setState(() => _delivery = v),
                                          validator: (v) => v == null
                                              ? l10n.validationRequired
                                              : null,
                                        ),
                                        const SizedBox(height: 16),
                                        OutlinedButton.icon(
                                          onPressed: () async {
                                            final d = await showDatePicker(
                                              context: context,
                                              initialDate: _neededBy ??
                                                  DateTime.now().add(
                                                    const Duration(days: 3),
                                                  ),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.now().add(
                                                const Duration(days: 365),
                                              ),
                                            );
                                            if (d != null) {
                                              setState(() => _neededBy = d);
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.event_outlined,
                                          ),
                                          label: Text(
                                            _neededBy == null
                                                ? l10n.serviceRequestNeededBy
                                                : _neededBy!
                                                    .toIso8601String()
                                                    .split('T')
                                                    .first,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        TextFormField(
                                          controller: _details,
                                          minLines: 4,
                                          maxLines: 8,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          decoration: InputDecoration(
                                            labelText: l10n.serviceRequestDetails,
                                            hintText:
                                                l10n.serviceRequestDetailsHint,
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
