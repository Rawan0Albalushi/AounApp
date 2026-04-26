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

  String _labelForServiceType(String value, bool isAr) {
    for (final s in DemoData.serviceTypes) {
      if (s.$1 == value) return isAr ? s.$3 : s.$2;
    }
    return value;
  }

  String _labelForDeliveryMethod(String value, bool isAr) {
    for (final d in DemoData.deliveryMethods) {
      if (d.$1 == value) return isAr ? d.$3 : d.$2;
    }
    return value;
  }

  Future<String?> _showOptionsPicker({
    required String title,
    required List<(String, String, String)> options,
    required String? selectedValue,
    required bool isAr,
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
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                for (final option in options)
                  ListTile(
                    title: Text(
                      isAr ? option.$3 : option.$2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: selectedValue == option.$1
                        ? const Icon(Icons.check_circle, color: AppColors.navy)
                        : Icon(
                            Icons.circle_outlined,
                            color: scheme.onSurface.withValues(alpha: 0.4),
                          ),
                    onTap: () => Navigator.of(context).pop(option.$1),
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
                                        FormField<String>(
                                          initialValue: _serviceType,
                                          validator: (v) => (v ?? _serviceType) ==
                                                  null
                                              ? l10n.validationRequired
                                              : null,
                                          builder: (field) {
                                            final selected = _serviceType;
                                            return InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () async {
                                                final picked =
                                                    await _showOptionsPicker(
                                                      title: l10n.serviceType,
                                                      options: DemoData
                                                          .serviceTypes,
                                                      selectedValue: selected,
                                                      isAr: isAr,
                                                      scheme: scheme,
                                                    );
                                                if (picked == null) return;
                                                setState(
                                                  () => _serviceType = picked,
                                                );
                                                field.didChange(picked);
                                                field.validate();
                                              },
                                              child: InputDecorator(
                                                isEmpty: selected == null,
                                                decoration: InputDecoration(
                                                  labelText: l10n.serviceType,
                                                  filled: true,
                                                  errorText: field.errorText,
                                                  suffixIcon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                  ),
                                                ),
                                                child: selected == null
                                                    ? null
                                                    : Text(
                                                        _labelForServiceType(
                                                          selected,
                                                          isAr,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 16),
                                        FormField<String>(
                                          initialValue: _delivery,
                                          validator: (v) => (v ?? _delivery) ==
                                                  null
                                              ? l10n.validationRequired
                                              : null,
                                          builder: (field) {
                                            final selected = _delivery;
                                            return InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              onTap: () async {
                                                final picked =
                                                    await _showOptionsPicker(
                                                      title:
                                                          l10n.deliveryMethod,
                                                      options: DemoData
                                                          .deliveryMethods,
                                                      selectedValue: selected,
                                                      isAr: isAr,
                                                      scheme: scheme,
                                                    );
                                                if (picked == null) return;
                                                setState(
                                                  () => _delivery = picked,
                                                );
                                                field.didChange(picked);
                                                field.validate();
                                              },
                                              child: InputDecorator(
                                                isEmpty: selected == null,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      l10n.deliveryMethod,
                                                  filled: true,
                                                  errorText: field.errorText,
                                                  suffixIcon: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                  ),
                                                ),
                                                child: selected == null
                                                    ? null
                                                    : Text(
                                                        _labelForDeliveryMethod(
                                                          selected,
                                                          isAr,
                                                        ),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                              ),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 16),
                                        OutlinedButton.icon(
                                          onPressed: () async {
                                            final d = await showDatePicker(
                                              context: context,
                                              initialDate:
                                                  _neededBy ??
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
                                            labelText:
                                                l10n.serviceRequestDetails,
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
