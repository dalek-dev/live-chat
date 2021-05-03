import 'package:chat_realtime/config/app_theme.dart';
import 'package:flutter/material.dart';

mixin SnacksMixin {
  final Duration _defaultDuration = Duration(milliseconds: 4000);

  void showErrorSnack(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.error_outline_sharp,
              color: Colors.white,
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        duration: _defaultDuration,
        elevation: 0.0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: MyTheme.errorBackground,
      ),
    );
  }

  void showInfoSnack({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        duration: _defaultDuration,
        elevation: 0.0,
        behavior: SnackBarBehavior.floating,
        backgroundColor:MyTheme.primaryColor,
      ),
    );
  }

  void showSnack({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        duration: _defaultDuration,
        elevation: 0.0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }
}
