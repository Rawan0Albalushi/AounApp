import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_app_bar.dart';
import '../../widgets/haptic_button.dart';

class CreateAnnouncementView extends StatefulWidget {
  const CreateAnnouncementView({super.key});

  @override
  State<CreateAnnouncementView> createState() => _CreateAnnouncementViewState();
}

class _CreateAnnouncementViewState extends State<CreateAnnouncementView> {
  final _formKey = GlobalKey<FormState>();
  final _titleEn = TextEditingController();
  final _titleAr = TextEditingController();
  final _bodyEn = TextEditingController();
  final _bodyAr = TextEditingController();

  @override
  void initState() {
    super.initState();
    final sample = DemoData.announcements.first;
    _titleEn.text = sample.title;
    _titleAr.text = sample.titleAr ?? sample.title;
    _bodyEn.text = sample.bodyEn;
    _bodyAr.text = sample.bodyAr;
  }

  @override
  void dispose() {
    _titleEn.dispose();
    _titleAr.dispose();
    _bodyEn.dispose();
    _bodyAr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: buildCorporateAppBar(context, title: l10n.createAnnouncement),
      body: AppShellBackdrop(
        child: LayoutBuilder(
        builder: (context, constraints) {
          final maxW = contentMaxWidth(context);
          return Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              padding: pagePadding(context),
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxW),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _titleEn,
                        decoration: InputDecoration(
                          labelText: l10n.announcementTitleEn,
                        ),
                        validator: (v) =>
                            (v == null || v.trim().isEmpty)
                                ? l10n.validationRequired
                                : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _titleAr,
                        decoration: InputDecoration(
                          labelText: l10n.announcementTitleAr,
                        ),
                        validator: (v) =>
                            (v == null || v.trim().isEmpty)
                                ? l10n.validationRequired
                                : null,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _bodyEn,
                        minLines: 3,
                        maxLines: 6,
                        decoration: InputDecoration(
                          labelText: l10n.announcementBodyEn,
                          alignLabelWithHint: true,
                        ),
                        validator: (v) =>
                            (v == null || v.trim().isEmpty)
                                ? l10n.validationRequired
                                : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _bodyAr,
                        minLines: 3,
                        maxLines: 6,
                        decoration: InputDecoration(
                          labelText: l10n.announcementBodyAr,
                          alignLabelWithHint: true,
                        ),
                        validator: (v) =>
                            (v == null || v.trim().isEmpty)
                                ? l10n.validationRequired
                                : null,
                      ),
                      const SizedBox(height: 24),
                      HapticFilledButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text(l10n.commonSubmit),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        ),
      ),
    );
  }
}
