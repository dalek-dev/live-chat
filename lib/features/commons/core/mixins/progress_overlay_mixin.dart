import 'package:chat_realtime/features/commons/widgets/progress_overlay.dart';
import 'package:flutter/material.dart';

mixin ProgressOverlayMixin {
  ProgressOverlay _progressOverlay = ProgressOverlay();

  void showProgress(BuildContext context) {
    _progressOverlay.show(context);
  }

  void hideProgress() {
    _progressOverlay.hide();
  }
}
