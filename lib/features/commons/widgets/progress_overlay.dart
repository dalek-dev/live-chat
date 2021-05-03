import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:chat_realtime/config/app_theme.dart';
import 'package:flutter/material.dart';

class ProgressOverlay {
  static final ProgressOverlay _singleton = ProgressOverlay._internal();

  factory ProgressOverlay() {
    return _singleton;
  }

  ProgressOverlay._internal();

  OverlayEntry? _progressOverlayEntry;

  void show(BuildContext context, {String? label}) {
    _progressOverlayEntry = _createProgressEntry(context, label: label);
    Overlay.of(context)?.insert(_progressOverlayEntry!);
    BackButtonInterceptor.add(backButtonPreventer);
  }

  void hide() {
    if (_progressOverlayEntry != null) {
      _progressOverlayEntry?.remove();
      _progressOverlayEntry = null;
      BackButtonInterceptor.remove(backButtonPreventer);
    }
  }

  bool backButtonPreventer(bool stopDefaultButtonEvent, _) {
    return true;
  }

  OverlayEntry _createProgressEntry(BuildContext context, {String? label}) {
    return OverlayEntry(
      builder: (BuildContext context) => Stack(
        children: <Widget>[
          Container(color: Colors.black.withOpacity(0.8)),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: MyTheme.primaryColor,
                      shape: BoxShape.circle),
                  width: 42,
                  height: 42,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(MyTheme.accentColor),
                    ),
                  ),
                ),
                label != null
                    ? Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}