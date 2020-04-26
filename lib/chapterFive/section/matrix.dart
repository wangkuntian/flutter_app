import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class MatrixListPage extends StatelessWidget {
  final List<String> items = ['Rotation', 'Skew'];
  final List<String> routes = ['/rotationPage', '/skewPage'];

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    Section section = arguments['section'];
    return HYCommonListView(
        title: 'Matrix', items: items, routes: routes, section: section);
  }
}

class RotationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RotationPageState();
}

class RotationPageState extends State<RotationPage> {
  Section section;
  final List<String> items = ['rotationX', 'rotationY', 'rotationZ'];
  final List<double> values = [0, 0, 0];
  Matrix4 _transform = Matrix4.rotationX(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(
        title: 'Rotation',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: HYTransformView(
        title: 'Rotation',
        items: items,
        values: values,
        limit: pi * 2,
        child: Transform(
            transform: _transform,
            child: HYText.bigAndBold(title: 'Hello World')),
        onChanged: (index, value) => setState(() {
          values[index] = value;
          if (index == 0) {
            _transform = Matrix4.rotationX(value);
          } else if (index == 1) {
            _transform = Matrix4.rotationY(value);
          } else {
            _transform = Matrix4.rotationZ(value);
          }
        }),
      ),
    );
  }
}

class SkewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SkewPageState();
}

class SkewPageState extends State<SkewPage> {
  Section section;
  final List<String> items = ['skewX', 'skewY'];
  final List<double> values = [0, 0];
  Matrix4 _transform = Matrix4.skewX(0);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(
        title: 'Rotation',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: HYTransformView(
        title: 'Skew',
        items: items,
        values: values,
        limit: pi,
        child: Transform(
            transform: _transform,
            child: HYText.bigAndBold(title: 'Hello World')),
        onChanged: (index, value) => setState(() {
          values[index] = value;
          if (index == 0) {
            _transform = Matrix4.skewX(value);
          } else if (index == 1) {
            _transform = Matrix4.skewY(value);
          }
        }),
      ),
    );
  }
}
