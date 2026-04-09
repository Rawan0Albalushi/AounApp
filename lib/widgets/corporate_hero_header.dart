import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/theme/app_colors.dart';
import 'corporate_app_bar.dart';

/// Hero header height aligned with [DashboardView] `_HomeHeader`.
const double kCorporateHeroHeaderHeight = 240;

/// Overlap into the body (same as dashboard status cards at `top: 168`).
const double kCorporateHeroOverlap = 72;

List<BoxShadow> corporateHeroHeaderShadow(BuildContext context) {
  return [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.06),
      blurRadius: 20,
      offset: const Offset(0, 8),
      spreadRadius: -4,
    ),
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ];
}

/// Navy gradient page header with optional subtitle and/or bottom (e.g. [TabBar]).
class CorporateHeroHeader extends StatelessWidget {
  const CorporateHeroHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.actions,
    this.bottom,
  });

  final String title;
  final String? subtitle;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    final canPop = Navigator.canPop(context);
    final Widget leadingSlot = leading ??
        (canPop
            ? IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                color: Colors.white,
                tooltip:
                    MaterialLocalizations.of(context).backButtonTooltip,
              )
            : const SizedBox(width: 48));
    final List<Widget>? actionList = actions;
    final Widget trailingSlot = (actionList != null && actionList.isNotEmpty)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: actionList,
          )
        : const SizedBox(width: 48);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        height: kCorporateHeroHeaderHeight,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(kCorporateAppBarBottomRadius),
            bottomRight: Radius.circular(kCorporateAppBarBottomRadius),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.navy,
              AppColors.navyGradientEnd,
              Color(0xFF455A94),
            ],
            stops: [0, 0.6, 1],
          ),
          boxShadow: corporateHeroHeaderShadow(context),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(4, topInset + 12, 4, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  leadingSlot,
                  Expanded(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  trailingSlot,
                ],
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 10),
                Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.88),
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
              if (bottom != null) ...[
                const SizedBox(height: 8),
                bottom!,
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Pulls content up under the hero gradient ([kCorporateHeroOverlap]).
class CorporateHeroOverlap extends StatelessWidget {
  const CorporateHeroOverlap({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -kCorporateHeroOverlap),
      child: padding != null
          ? Padding(padding: padding!, child: child)
          : child,
    );
  }
}
