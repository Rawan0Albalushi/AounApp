import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/auth_branded_layout.dart';
import '../../widgets/haptic_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();

  @override
  void initState() {
    super.initState();
    _email.text = 'demo@aoun.app';
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: AppShellBackdrop(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthHeroHeader(
              showBackButton: true,
              brandLabel: l10n.appTitle,
              headline: l10n.forgotTitle,
              subtitle: l10n.forgotSubtitle,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 36),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: kAuthFormMaxWidth),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: l10n.fieldEmail,
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColors.goldDark,
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return l10n.validationRequired;
                              }
                              if (!v.contains('@')) return l10n.validationEmail;
                              return null;
                            },
                          ),
                          const SizedBox(height: 28),
                          HapticFilledButton(
                            onPressed: () {
                              if (!(_formKey.currentState?.validate() ?? false)) {
                                return;
                              }
                              context
                                  .read<AuthProvider>()
                                  .setPendingEmail(_email.text.trim());
                              Navigator.of(context).pushNamed(AppRoutes.otp);
                            },
                            child: Text(l10n.sendCode),
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
