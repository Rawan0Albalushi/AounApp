import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/responsive.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/auth_branded_layout.dart';
import '../../widgets/corporate_hero_header.dart';
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

  final _focusCurrent = FocusNode();
  final _focusNew = FocusNode();
  final _focusConfirm = FocusNode();

  bool _obscure0 = true;
  bool _obscure1 = true;
  bool _obscure2 = true;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _pass.addListener(_onPassTextChanged);
  }

  void _onPassTextChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _pass.removeListener(_onPassTextChanged);
    _current.dispose();
    _pass.dispose();
    _confirm.dispose();
    _focusCurrent.dispose();
    _focusNew.dispose();
    _focusConfirm.dispose();
    super.dispose();
  }

  /// 0 = empty, 1 = weak, 2–4 = increasing strength.
  int _passwordStrengthLevel(String p) {
    if (p.isEmpty) return 0;
    if (p.length < 8) return 1;
    final hasLetter = RegExp(r'[A-Za-z\u0600-\u06FF]').hasMatch(p);
    final hasDigit = RegExp(r'\d').hasMatch(p);
    if (!hasLetter || !hasDigit) return 2;
    final hasSpecial = RegExp(r'[^\w\s\u0600-\u06FF]').hasMatch(p);
    if (hasSpecial || p.length >= 12) return 4;
    return 3;
  }

  Color _strengthColor(BuildContext context, int level, int barIndex) {
    final scheme = Theme.of(context).colorScheme;
    final active = level > barIndex;
    if (!active) {
      return scheme.outlineVariant.withValues(alpha: 0.45);
    }
    if (level <= 1) return AppColors.statusRejectedFg.withValues(alpha: 0.85);
    if (level == 2) return AppColors.statusPendingFg;
    if (level == 3) return AppColors.goldDark;
    return AppColors.statusApprovedFg;
  }

  Future<void> _submit(AppLocalizations l10n) async {
    if (_isSubmitting) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _isSubmitting = true);
    try {
      await context.read<AuthProvider>().changePassword(
        currentPassword: _current.text,
        newPassword: _pass.text,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.changePasswordSuccess),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
        ),
      );
      Navigator.of(context).pop();
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final pageInsets = pagePadding(context);
    final scheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final strength = _passwordStrengthLevel(_pass.text);
    final screenH = MediaQuery.sizeOf(context).height;
    final viewportH = screenH - keyboardInset;
    // Taller card; button anchored to bottom. Shrinks slightly when keyboard is open.
    final cardHeight = (viewportH * 0.56).clamp(360.0, 600.0);

    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      resizeToAvoidBottomInset: true,
      body: AppShellBackdrop(
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: pageInsets.bottom + 28 + keyboardInset,
            ),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: kAuthFormMaxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CorporateHeroHeader(
                      title: l10n.changePasswordTitle,
                      subtitle: l10n.changePasswordSubtitle,
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.white,
                        tooltip: MaterialLocalizations.of(
                          context,
                        ).backButtonTooltip,
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                    CorporateHeroOverlap(
                      padding: EdgeInsets.fromLTRB(
                        pageInsets.left,
                        kCorporateHeroBodyTopSpacing,
                        pageInsets.right,
                        0,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: scheme.surface,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: authCardShadows(context),
                          border: Border.all(
                            color: scheme.outlineVariant.withValues(
                              alpha: 0.35,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 26, 20, 28),
                          child: AutofillGroup(
                            child: Form(
                              key: _formKey,
                              child: SizedBox(
                                height: cardHeight,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextFormField(
                                              controller: _current,
                                              focusNode: _focusCurrent,
                                              obscureText: _obscure0,
                                              autofillHints: const [
                                                AutofillHints.password,
                                              ],
                                              textInputAction:
                                                  TextInputAction.next,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              onFieldSubmitted: (_) =>
                                                  _focusNew.requestFocus(),
                                              decoration: InputDecoration(
                                                labelText:
                                                    l10n.fieldCurrentPassword,
                                                prefixIcon: const Icon(
                                                  Icons.key_rounded,
                                                  color: AppColors.goldDark,
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () => setState(
                                                    () =>
                                                        _obscure0 = !_obscure0,
                                                  ),
                                                  icon: Icon(
                                                    _obscure0
                                                        ? Icons
                                                              .visibility_outlined
                                                        : Icons
                                                              .visibility_off_outlined,
                                                  ),
                                                ),
                                              ),
                                              validator: (v) {
                                                if (v == null || v.isEmpty) {
                                                  return l10n
                                                      .validationRequired;
                                                }
                                                return null;
                                              },
                                            ),
                                            const SizedBox(height: 18),
                                            TextFormField(
                                              controller: _pass,
                                              focusNode: _focusNew,
                                              obscureText: _obscure1,
                                              autofillHints: const [
                                                AutofillHints.newPassword,
                                              ],
                                              textInputAction:
                                                  TextInputAction.next,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              onFieldSubmitted: (_) =>
                                                  _focusConfirm.requestFocus(),
                                              decoration: InputDecoration(
                                                labelText: l10n.fieldPassword,
                                                prefixIcon: const Icon(
                                                  Icons.lock_reset_rounded,
                                                  color: AppColors.goldDark,
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () => setState(
                                                    () =>
                                                        _obscure1 = !_obscure1,
                                                  ),
                                                  icon: Icon(
                                                    _obscure1
                                                        ? Icons
                                                              .visibility_outlined
                                                        : Icons
                                                              .visibility_off_outlined,
                                                  ),
                                                ),
                                              ),
                                              validator: (v) {
                                                if (v == null || v.isEmpty) {
                                                  return l10n
                                                      .validationRequired;
                                                }
                                                if (v.length < 8) {
                                                  return l10n
                                                      .validationMinPassword;
                                                }
                                                if (v == _current.text) {
                                                  return l10n
                                                      .validationPasswordSameAsCurrent;
                                                }
                                                return null;
                                              },
                                            ),
                                            if (_pass.text.isNotEmpty) ...[
                                              const SizedBox(height: 10),
                                              Row(
                                                children: List.generate(4, (i) {
                                                  return Expanded(
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                        left: i == 0 ? 0 : 5,
                                                      ),
                                                      child: AnimatedContainer(
                                                        duration:
                                                            const Duration(
                                                              milliseconds: 200,
                                                            ),
                                                        height: 4,
                                                        decoration: BoxDecoration(
                                                          color: _strengthColor(
                                                            context,
                                                            strength,
                                                            i,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                2,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ],
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 4,
                                                right: 4,
                                              ),
                                              child: Text(
                                                l10n.validationMinPassword,
                                                style: theme.textTheme.bodySmall
                                                    ?.copyWith(
                                                      color: scheme.onSurface
                                                          .withValues(
                                                            alpha: 0.55,
                                                          ),
                                                      height: 1.35,
                                                    ),
                                              ),
                                            ),
                                            const SizedBox(height: 18),
                                            TextFormField(
                                              controller: _confirm,
                                              focusNode: _focusConfirm,
                                              obscureText: _obscure2,
                                              autofillHints: const [
                                                AutofillHints.newPassword,
                                              ],
                                              textInputAction:
                                                  TextInputAction.done,
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              onFieldSubmitted: (_) {
                                                if (!_isSubmitting)
                                                  _submit(l10n);
                                              },
                                              decoration: InputDecoration(
                                                labelText:
                                                    l10n.fieldConfirmPassword,
                                                prefixIcon: const Icon(
                                                  Icons.verified_user_outlined,
                                                  color: AppColors.goldDark,
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () => setState(
                                                    () =>
                                                        _obscure2 = !_obscure2,
                                                  ),
                                                  icon: Icon(
                                                    _obscure2
                                                        ? Icons
                                                              .visibility_outlined
                                                        : Icons
                                                              .visibility_off_outlined,
                                                  ),
                                                ),
                                              ),
                                              validator: (v) {
                                                if (v == null || v.isEmpty) {
                                                  return l10n
                                                      .validationRequired;
                                                }
                                                if (v != _pass.text) {
                                                  return l10n
                                                      .validationPasswordMatch;
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    HapticFilledButton(
                                      onPressed: _isSubmitting
                                          ? null
                                          : () => _submit(l10n),
                                      child: _isSubmitting
                                          ? SizedBox(
                                              height: 22,
                                              width: 22,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2.5,
                                                color: scheme.onPrimary,
                                              ),
                                            )
                                          : Text(l10n.settingsChangePassword),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
