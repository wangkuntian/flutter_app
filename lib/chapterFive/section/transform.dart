import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class TransformListPage extends StatelessWidget {
  final List<String> items = ['平移', '旋转', '缩放'];
  final List<String> routes = ['/translatePage', '/rotatePage', '/scalePage'];

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    Section section = arguments['section'];
    return HYCommonListView(
        title: 'Transform', items: items, routes: routes, section: section);
  }
}

class TranslatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TranslatePageState();
}

class TranslatePageState extends State<TranslatePage> {
  Section section;
  final List<String> items = ['x', 'y'];
  List<double> values = [0, 0];

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
        title: 'Translate',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: TransformView(
        title: 'Translate',
        items: items,
        values: values,
        limit: 100,
        onChanged: (index, value) => setState(() => values[index] = value),
        child: Transform.translate(
            offset: Offset(values[0], values[1]),
            child: HYText.bigAndBold(title: 'Hello World')),
      ),
    );
  }
}

class RotatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RotatePageState();
}

class RotatePageState extends State<RotatePage> {
  Section section;
  final List<String> items = ['angle'];
  List<double> values = [0];

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
        title: 'Rotate',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: TransformView(
        title: 'Rotate',
        items: items,
        values: values,
        limit: 2 * pi,
        onChanged: (index, value) => setState(() => values[index] = value),
        child: Transform.rotate(
          angle: values[0],
          child: HYText.bigAndBold(title: 'Hello World'),
        ),
      ),
    );
  }
}

class ScalePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScalePageState();
}

class ScalePageState extends State<ScalePage> {
  Section section;
  final List<String> items = ['angle'];
  List<double> values = [1];

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
        title: 'Scale',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: TransformView(
        title: 'Scale',
        items: items,
        values: values,
        limit: 2,
        onChanged: (index, value) => setState(() => values[index] = value),
        child: Transform.scale(
          scale: values[0],
          child: HYText.bigAndBold(title: 'Hello World'),
        ),
      ),
    );
  }
}
