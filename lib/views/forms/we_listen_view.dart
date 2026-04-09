import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_app_bar.dart';
import '../../widgets/haptic_button.dart';

class WeListenView extends StatefulWidget {
  const WeListenView({super.key});

  @override
  State<WeListenView> createState() => _WeListenViewState();
}

class _WeListenViewState extends State<WeListenView> {
  final _formKey = GlobalKey<FormState>();
  final _message = TextEditingController();
  String _priority = 'medium';
  String? _category;
  bool _seededSampleText = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_seededSampleText) {
      _seededSampleText = true;
      _message.text = AppLocalizations.of(context).demoSampleFeedbackBody;
    }
  }

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: buildCorporateAppBar(context, title: l10n.weListenTitle),
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
                      DropdownButtonFormField<String>(
                        value: _category, // ignore: deprecated_member_use
                        decoration: InputDecoration(
                          labelText: l10n.feedbackCategory,
                        ),
                        items: [
                          for (final c in DemoData.feedbackCategories)
                            DropdownMenuItem(
                              value: c.$1,
                              child: Text(isAr ? c.$3 : c.$2),
                            ),
                        ],
                        onChanged: (v) => setState(() => _category = v),
                        validator: (v) =>
                            v == null ? l10n.validationRequired : null,
                      ),
                      const SizedBox(height: 16),
                      Text(l10n.priority,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 8),
                      SegmentedButton<String>(
                        segments: [
                          ButtonSegment(
                            value: 'low',
                            label: Text(l10n.priorityLow),
                          ),
                          ButtonSegment(
                            value: 'medium',
                            label: Text(l10n.priorityMedium),
                          ),
                          ButtonSegment(
                            value: 'high',
                            label: Text(l10n.priorityHigh),
                          ),
                        ],
                        selected: {_priority},
                        onSelectionChanged: (s) {
                          setState(() => _priority = s.first);
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _message,
                        minLines: 4,
                        maxLines: 8,
                        decoration: InputDecoration(
                          labelText: l10n.feedbackMessage,
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
