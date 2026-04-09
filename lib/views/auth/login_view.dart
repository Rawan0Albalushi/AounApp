import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/router/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/auth_branded_layout.dart';
import '../../widgets/haptic_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

  @override
  void initState() {
    super.initState();
    _email.text = 'demo@aoun.app';
    _password.text = 'password12';
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  String? _emailValidator(String? v, AppLocalizations l10n) {
    if (v == null || v.trim().isEmpty) return l10n.validationRequired;
    if (!v.contains('@')) return l10n.validationEmail;
    return null;
  }

  String? _passwordValidator(String? v, AppLocalizations l10n) {
    if (v == null || v.isEmpty) return l10n.validationRequired;
    if (v.length < 8) return l10n.validationMinPassword;
    return null;
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    await context.read<AuthProvider>().login(_email.text.trim(), _password.text);
    if (!mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.main,
      (r) => false,
    );
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
              brandLabel: l10n.appTitle,
              headline: l10n.loginTitle,
              subtitle: l10n.loginSubtitle,
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
                          authDemoHintBanner(
                            context: context,
                            text: l10n.demoLoginHint,
                          ),
                          const SizedBox(height: 28),
                          TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: l10n.fieldEmail,
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColors.goldDark,
                              ),
                            ),
                            validator: (v) => _emailValidator(v, l10n),
                          ),
                          const SizedBox(height: 18),
                          TextFormField(
                            controller: _password,
                            obscureText: _obscure,
                            textInputAction: TextInputAction.done,
                            onFieldSubmitted: (_) => _submit(),
                            decoration: InputDecoration(
                              labelText: l10n.fieldPassword,
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: AppColors.goldDark,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    setState(() => _obscure = !_obscure),
                                icon: Icon(
                                  _obscure
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                ),
                              ),
                            ),
                            validator: (v) => _passwordValidator(v, l10n),
                          ),
                          const SizedBox(height: 8),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: TextButton(
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(AppRoutes.forgotPassword),
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.navy,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                              ),
                              child: Text(l10n.forgotPassword),
                            ),
                          ),
                          const SizedBox(height: 20),
                          HapticFilledButton(
                            onPressed: _submit,
                            child: Text(l10n.loginAction),
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
