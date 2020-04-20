import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class WrapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WrapPageState();
}

class WrapPageState extends State<WrapPage> {
  Section section;
  final List<String> subjects = [
    'Math',
    'Art',
    'Chinese',
    'Physic',
    'Chemistry',
    'English',
    'Music'
  ];
  Axis _direction = Axis.horizontal;
  final List<Axis> _directions = Axis.values;

  WrapAlignment _alignment = WrapAlignment.start;
  final List<WrapAlignment> _alignments = WrapAlignment.values;

  double _spacing = 0.0;
  final List<String> symbols = ['-', '+'];

  WrapAlignment _runAlignment = WrapAlignment.start;
  final List<WrapAlignment> _runAlignments = WrapAlignment.values;

  double _runSpacing = 0.0;

  WrapCrossAlignment _crossAxisAlignment = WrapCrossAlignment.start;
  final List<WrapCrossAlignment> _crossAxisAlignments =
      WrapCrossAlignment.values;

  TextDirection _textDirection = TextDirection.ltr;
  final List<TextDirection> _textDirections = TextDirection.values;

  VerticalDirection _verticalDirection = VerticalDirection.down;
  final List<VerticalDirection> _verticalDirections = VerticalDirection.values;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
    subjects.sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(
        title: 'Wrap',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              width: physicalWidth,
              height: 300 * vHeight,
              child: Wrap(
                direction: _direction,
                alignment: _alignment,
                spacing: _spacing,
                runAlignment: _runAlignment,
                runSpacing: _runSpacing,
                crossAxisAlignment: _crossAxisAlignment,
                textDirection: _textDirection,
                verticalDirection: _verticalDirection,
                children: subjects
                    .map((subject) => Chip(
                          avatar: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: HYText(
                              title: subject.toUpperCase()[0],
                            ),
                          ),
                          label: HYText(
                            title: subject,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20 * vWidth, top: 20 * vHeight),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(
                        title: 'direction',
                      ),
                      DropdownButton(
                        value: _direction,
                        items: _directions
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: HYText(
                                  title: item.toString(),
                                )))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _direction = value),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20 * vWidth, top: 20 * vHeight),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(
                        title: 'alignment',
                      ),
                      DropdownButton(
                        value: _alignment,
                        items: _alignments
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: HYText(
                                  title: item.toString(),
                                )))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _alignment = value),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20 * vWidth, top: 20 * vHeight),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(
                        title: 'spacing: $_spacing',
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 40 * vWidth,
                        children: symbols
                            .map((s) => HYRaisedButton(
                                  title: s,
                                  onPressed: () {
                                    if (s == '-') {
                                      if (_spacing > 0) {
                                        setState(() => _spacing -= 1);
                                      }
                                    } else {
                                      setState(() => _spacing += 1);
                                    }
                                  },
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20 * vWidth, top: 20 * vHeight),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(
                        title: 'runAlignment',
                      ),
                      DropdownButton(
                        value: _runAlignment,
                        items: _runAlignments
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: HYText(
                                  title: item.toString(),
                                )))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _runAlignment = value),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20 * vWidth, top: 20 * vHeight),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(
                        title: 'runSpacing: $_runSpacing',
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 40 * vWidth,
                        children: symbols
                            .map((s) => HYRaisedButton(
                                  title: s,
                                  onPressed: () {
                                    if (s == '-') {
                                      if (_runSpacing > 0) {
                                        setState(() => _runSpacing -= 1);
                                      }
                                    } else {
                                      setState(() => _runSpacing += 1);
                                    }
                                  },
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20 * vWidth, top: 20 * vHeight),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(
                        title: 'crossAxisAlignment',
                      ),
                      DropdownButton(
                        value: _crossAxisAlignment,
                        items: _crossAxisAlignments
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: HYText(
                                  title: item.toString(),
                                )))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _crossAxisAlignment = value),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20 * vWidth, top: 20 * vHeight),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(
                        title: 'textDirection',
                      ),
                      DropdownButton(
                        value: _textDirection,
                        items: _textDirections
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: HYText(
                                  title: item.toString(),
                                )))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _textDirection = value),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20 * vWidth, top: 20 * vHeight),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(
                        title: 'verticalDirection',
                      ),
                      DropdownButton(
                        value: _verticalDirection,
                        items: _verticalDirections
                            .map((item) => DropdownMenuItem(
                                value: item,
                                child: HYText(
                                  title: item.toString(),
                                )))
                            .toList(),
                        onChanged: (value) =>
                            setState(() => _verticalDirection = value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FlowPage extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.lightGreen,
    Colors.blue,
    Colors.yellow,
    Colors.lime,
    Colors.black
  ];

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    Section section = arguments['section'];
    return Scaffold(
      appBar: HYAppBar(
        title: 'Flow',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Flow(
        delegate: MyFlowDelegate(margin: EdgeInsets.all(10 * vWidth)),
        children: colors
            .map((color) => Container(
                  width: 80 * vWidth,
                  height: 80 * vHeight,
                  color: color,
                ))
            .toList(),
      ),
    );
  }
}

class MyFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  MyFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 300 * vHeight);
  }
}
