import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/auth_branded_layout.dart';
import '../../widgets/corporate_app_bar.dart';
import '../../widgets/haptic_button.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _current = TextEditingController();
  final _pass = TextEditingController();
  final _confirm = TextEditingController();
  bool _obscure0 = true;
  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  void dispose() {
    _current.dispose();
    _pass.dispose();
    _confirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: buildCorporateAppBar(
        context,
        title: l10n.changePasswordTitle,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
      ),
      body: AppShellBackdrop(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: pagePadding(context).copyWith(top: 20, bottom: 28),
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: kAuthFormMaxWidth),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n.changePasswordSubtitle,
                        textAlign: TextAlign.center,
                        style: authSectionMutedStyle(context, scheme),
                      ),
                      const SizedBox(height: 28),
                      TextFormField(
                        controller: _current,
                        obscureText: _obscure0,
                        decoration: InputDecoration(
                          labelText: l10n.fieldCurrentPassword,
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: AppColors.goldDark,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () =>
                                setState(() => _obscure0 = !_obscure0),
                            icon: Icon(
                              _obscure0
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return l10n.validationRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: _pass,
                        obscureText: _obscure1,
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
                          await context.read<AuthProvider>().changePassword();
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l10n.changePasswordSuccess)),
                          );
                          Navigator.of(context).pop();
                        },
                        child: Text(l10n.settingsChangePassword),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
