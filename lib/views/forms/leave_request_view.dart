import 'package:flutter/material.dart';

import '../../core/utils/responsive.dart';
import '../../data/demo_data.dart';
import '../../l10n/app_localizations.dart';
import '../../widgets/app_shell_backdrop.dart';
import '../../widgets/corporate_app_bar.dart';
import '../../widgets/haptic_button.dart';

class LeaveRequestView extends StatefulWidget {
  const LeaveRequestView({super.key});

  @override
  State<LeaveRequestView> createState() => _LeaveRequestViewState();
}

class _LeaveRequestViewState extends State<LeaveRequestView> {
  final _formKey = GlobalKey<FormState>();
  String? _type;
  DateTime? _start;
  DateTime? _end;
  String? _attachmentName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      appBar: buildCorporateAppBar(context, title: l10n.leaveRequestTitle),
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
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              const Icon(Icons.account_balance_wallet_outlined),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l10n.leaveBalance,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      '${DemoData.leaveBalanceDays}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      l10n.leaveBalanceBreakdown,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface
                                                .withValues(alpha: 0.6),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _type, // ignore: deprecated_member_use
                        decoration: InputDecoration(
                          labelText: l10n.leaveType,
                        ),
                        items: [
                          for (final t in DemoData.leaveTypes)
                            DropdownMenuItem(
                              value: t.$1,
                              child: Text(isAr ? t.$3 : t.$2),
                            ),
                        ],
                        onChanged: (v) => setState(() => _type = v),
                        validator: (v) =>
                            v == null ? l10n.validationRequired : null,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () async {
                                final d = await showDatePicker(
                                  context: context,
                                  initialDate: _start ?? DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(const Duration(days: 365)),
                                  lastDate:
                                      DateTime.now().add(const Duration(days: 365)),
                                );
                                if (d != null) setState(() => _start = d);
                              },
                              icon: const Icon(Icons.date_range),
                              label: Text(
                                _start == null
                                    ? l10n.fieldDateStart
                                    : _start!.toIso8601String().split('T').first,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () async {
                                final d = await showDatePicker(
                                  context: context,
                                  initialDate: _end ?? DateTime.now(),
                                  firstDate: DateTime.now()
                                      .subtract(const Duration(days: 365)),
                                  lastDate:
                                      DateTime.now().add(const Duration(days: 365)),
                                );
                                if (d != null) setState(() => _end = d);
                              },
                              icon: const Icon(Icons.date_range),
                              label: Text(
                                _end == null
                                    ? l10n.fieldDateEnd
                                    : _end!.toIso8601String().split('T').first,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        onPressed: () {
                          setState(
                            () => _attachmentName = l10n.demoAttachmentPdf,
                          );
                        },
                        icon: const Icon(Icons.attach_file),
                        label: Text(
                          _attachmentName ?? l10n.pickFile,
                        ),
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
