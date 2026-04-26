import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/auth_branded_layout.dart';
import '../../widgets/haptic_button.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final _formKey = GlobalKey<FormState>();
  final _otp = TextEditingController();

  @override
  void initState() {
    super.initState();
    _otp.text = '123456';
  }

  @override
  void dispose() {
    _otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final email =
        context.watch<AuthProvider>().pendingOtpEmail ?? 'user@example.com';

    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: AppShellBackdrop(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthHeroHeader(
              showBackButton: true,
              brandLabel: l10n.appTitle,
              headline: l10n.otpTitle,
              subtitle: l10n.otpSubtitle(email),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 36),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: kAuthFormMaxWidth,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          authDemoHintBanner(
                            context: context,
                            text: l10n.demoOtpHint,
                          ),
                          const SizedBox(height: 28),
                          TextFormField(
                            controller: _otp,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            decoration: InputDecoration(
                              labelText: l10n.fieldOtp,
                              prefixIcon: const Icon(
                                Icons.pin_outlined,
                                color: AppColors.goldDark,
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.length < 6) {
                                return l10n.validationOtp;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 28),
                          HapticFilledButton(
                            onPressed: () async {
                              if (!(_formKey.currentState?.validate() ??
                                  false)) {
                                return;
                              }
                              await context.read<AuthProvider>().verifyOtp(
                                _otp.text,
                              );
                              if (!context.mounted) return;
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.resetPassword);
                            },
                            child: Text(l10n.verify),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
