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
  String? _serviceType;
  String? _delivery;

  @override
  void initState() {
    super.initState();
    _serviceType = DemoData.serviceTypes.first.$1;
    _delivery = DemoData.deliveryMethods.first.$1;
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
                          title: l10n.serviceRequestTitle,
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
                        value: _serviceType, // ignore: deprecated_member_use
                        decoration: InputDecoration(
                          labelText: l10n.serviceType,
                        ),
                        items: [
                          for (final s in DemoData.serviceTypes)
                            DropdownMenuItem(
                              value: s.$1,
                              child: Text(isAr ? s.$3 : s.$2),
                            ),
                        ],
                        onChanged: (v) => setState(() => _serviceType = v),
                        validator: (v) =>
                            v == null ? l10n.validationRequired : null,
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _delivery, // ignore: deprecated_member_use
                        decoration: InputDecoration(
                          labelText: l10n.deliveryMethod,
                        ),
                        items: [
                          for (final d in DemoData.deliveryMethods)
                            DropdownMenuItem(
                              value: d.$1,
                              child: Text(isAr ? d.$3 : d.$2),
                            ),
                        ],
                        onChanged: (v) => setState(() => _delivery = v),
                        validator: (v) =>
                            v == null ? l10n.validationRequired : null,
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
