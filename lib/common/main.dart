import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/view.dart';

export 'package:flutterapp/common/view.dart';
export 'package:flutterapp/common/storage.dart';
export 'package:flutterapp/common/theme.dart';
export 'package:flutterapp/common/provider.dart';
export 'package:flutterapp/common/routes.dart';
export 'package:flutterapp/common/page.dart';

void pushToWebView(BuildContext context, String url) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return HYWebView(url: url);
  }));
}

void showAlertDialog(BuildContext context, {String title, String content}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return HYAlertDialog(
          title: title,
          content: content,
          actions: <Widget>[
            HYFlatButton(
              title: 'OK',
              onPressed: () {
                Navigator.pop(context, true);
              },
            )
          ],
        );
      });
}

final double devicePixelRatio = window.devicePixelRatio;
final double physicalHeight = window.physicalSize.height / devicePixelRatio;
final double physicalWidth = window.physicalSize.width / devicePixelRatio;

final double vHeight = 3120.0 / window.physicalSize.height;
final double vWidth = 1440.0 / window.physicalSize.width;
