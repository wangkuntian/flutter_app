import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class FlexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FlexPageState();
}

class FlexPageState extends State<FlexPage> {
  Section section;
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.lime,
    Colors.black,
    Colors.amber,
    Colors.cyan,
    Colors.yellow,
    Colors.lightGreen
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  Widget getFlex(List<Color> _colors, Axis _direction) {
    if (_direction == Axis.vertical) {
      _direction = Axis.horizontal;
    } else {
      _direction = Axis.vertical;
    }
    if (_colors.length == 0) {
      return Flex(
        direction: _direction,
        children: <Widget>[],
      );
    }
    Color c = _colors.removeAt(0);
    return Flex(
      direction: _direction,
      children: <Widget>[
        Expanded(
          child: getFlex(_colors, _direction),
        ),
        Expanded(
          child: Container(
            color: c,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors_1 = colors.reversed.toList();
    List<Color> colors_2 = colors.reversed.toList();
    List<Color> colors_3 = colors.reversed.toList();
    List<Color> colors_4 = colors.reversed.toList();

    return Scaffold(
      appBar: HYAppBar(
        title: 'Flex',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(child: getFlex(colors_1, Axis.horizontal)),
                Expanded(child: getFlex(colors_2.reversed.toList(), Axis.horizontal))
              ],
            ),
          ),
          Expanded(
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(child: getFlex(colors_3.reversed.toList(), Axis.horizontal)),
                Expanded(child: getFlex(colors_4, Axis.horizontal))
              ],
            ),
          )
        ],
      ),
    );
  }
}
