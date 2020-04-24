import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

typedef IndexValueChanged = void Function(int index, double value);

class TransformView extends StatelessWidget {
  final Widget child;
  final String title;
  final List<String> items;
  final List<double> values;
  final double limit;
  final IndexValueChanged onChanged;

  const TransformView(
      {Key key,
      this.title,
      this.items,
      this.values,
      this.limit,
      this.onChanged,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Container(
                height: 180 * vWidth,
                width: 180 * vWidth,
                color: Colors.blue[100],
                child: child),
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20 * vWidth),
                child: HYText.bigAndBold(title: title),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 30 * vHeight, left: 20 * vWidth, right: 20 * vWidth),
                child: Wrap(
                    spacing: 20 * vWidth,
                    children: items
                        .asMap()
                        .keys
                        .map((index) => Wrap(
                              children: <Widget>[
                                HYText(
                                    title: items[index] +
                                        ': ' +
                                        values[index].toStringAsFixed(2)),
                                Center(
                                  child: Slider(
                                      value: values[index],
                                      max: limit,
                                      onChanged: (value) =>
                                          onChanged(index, value)),
                                )
                              ],
                            ))
                        .toList()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TransformListPage extends StatelessWidget {
  final List<String> items = [
    '平移',
    '旋转',
    '缩放',
  ];

  final List<String> routes = ['/translatePage', '/rotatePage', '/scalePage'];

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    Section section = arguments['section'];

    return Scaffold(
      appBar: HYAppBar(title: 'Transform'),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: HYText(title: items[index]),
                onTap: () => Navigator.pushNamed(context, routes[index],
                    arguments: {'section': section}),
              ),
          separatorBuilder: (context, index) => HYDivider(),
          itemCount: items.length),
    );
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
  void initState() {
    super.initState();
  }

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
  void initState() {
    super.initState();
  }

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
  void initState() {
    super.initState();
  }

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

class TransformPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransformPageState();
}

class TransformPageState extends State<TransformPage> {
  Section section;

  List<Alignment> _alignments = [
    Alignment.center,
    Alignment.topCenter,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.centerRight,
  ];

  Alignment _alignment = Alignment.center;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HYAppBar(
          title: 'Transform',
          actions: <Widget>[
            HYIconButton.web(
                onPressed: () => pushToWebView(context, section.url))
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                  child: Container(
                child: Transform(
                  alignment: _alignment,
                  transform: Matrix4.skewY(0.2),
                  child: HYText.bigAndBold(
                    title: 'Hello World',
                  ),
                ),
              )),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20 * vWidth),
                    child: HYText.bigAndBold(title: 'Transform'),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        HYText(title: 'alignment'),
                        HYDropdownButton(
                          value: _alignment,
                          items: _alignments,
                          onChanged: (value) =>
                              setState(() => _alignment = value),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
