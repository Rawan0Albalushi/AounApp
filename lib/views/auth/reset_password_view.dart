import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/auth_branded_layout.dart';
import '../../widgets/haptic_button.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  void dispose() {
    _pass.dispose();
    _confirm.dispose();
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
              headline: l10n.resetTitle,
              subtitle: l10n.resetSubtitle,
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
                            controller: _pass,
                            obscureText: _obscure1,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: l10n.fieldPassword,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColors.goldDark,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    setState(() => _obscure1 = !_obscure1),
                                icon: Icon(
                                  _obscure1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return l10n.validationRequired;
                              }
                              if (v.length < 8) return l10n.validationMinPassword;
                              return null;
                            },
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            controller: _confirm,
                            obscureText: _obscure2,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: l10n.fieldConfirmPassword,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColors.goldDark,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    setState(() => _obscure2 = !_obscure2),
                                icon: Icon(
                                  _obscure2
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v != _pass.text) {
                                return l10n.validationPasswordMatch;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 28),
                          HapticFilledButton(
                            onPressed: () async {
                              if (!(_formKey.currentState?.validate() ?? false)) {
                                return;
                              }
                              await context.read<AuthProvider>().completePasswordReset();
                              if (!context.mounted) return;
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.login,
                                (r) => false,
                              );
                            },
                            child: Text(l10n.resetPassword),
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
