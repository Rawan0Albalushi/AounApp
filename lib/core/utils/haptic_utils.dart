import 'package:flutter/services.dart';

/// Light haptic on primary actions (mobile; no-op on web/desktop where unsupported).
void lightImpact() {
  HapticFeedback.lightImpact();
}

void selectionClick() {
  HapticFeedback.selectionClick();
}
