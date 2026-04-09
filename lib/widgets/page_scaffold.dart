import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/utils/responsive.dart';
import 'app_shell_backdrop.dart';
import 'corporate_hero_header.dart';

/// Centers content on wide screens and applies consistent horizontal padding.
/// With [title], uses the same hero header + overlap pattern as the rest of the app.
class PageScaffold extends StatelessWidget {
  const PageScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.floatingActionButton,
    this.bottomNavigationBar,
  });

  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    final pageInsets = pagePadding(context);
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxW = contentMaxWidth(context);
          if (title == null) {
            return Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                padding: pagePadding(context),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                    maxWidth: maxW,
                  ),
                  child: body,
                ),
              ),
            );
          }
          return AppShellBackdrop(
            child: SafeArea(
              top: false,
              child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: pageInsets.bottom),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      maxWidth: maxW,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CorporateHeroHeader(
                          title: title!,
                          actions: actions,
                        ),
                        CorporateHeroOverlap(
                          padding: EdgeInsets.fromLTRB(
                            pageInsets.left,
                            kCorporateHeroBodyTopSpacing,
                            pageInsets.right,
                            0,
                          ),
                          child: body,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
