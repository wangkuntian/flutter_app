import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class RowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RowPageState();
}

class RowPageState extends State<RowPage> {
  final List<String> items = ['1', '2', '3', '4'];
  final List<MainAxisAlignment> _mainAxisAlignments = MainAxisAlignment.values;
  final List<MainAxisSize> _mainAxisSizes = MainAxisSize.values;
  final List<CrossAxisAlignment> _crossAxisAlignments =
      CrossAxisAlignment.values;
  final List<VerticalDirection> _verticalDirections = VerticalDirection.values;
  final List<TextBaseline> _textBaselines = TextBaseline.values;
  final List<TextDirection> _textDirections = TextDirection.values;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  TextBaseline _textBaseline = TextBaseline.alphabetic;
  TextDirection _textDirection = TextDirection.ltr;
  Section section;

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
        title: 'Row',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: physicalWidth,
            height: 200 * vHeight,
            child: Row(
              textDirection: _textDirection,
              textBaseline: _textBaseline,
              mainAxisAlignment: _mainAxisAlignment,
              mainAxisSize: _mainAxisSize,
              crossAxisAlignment: _crossAxisAlignment,
              verticalDirection: _verticalDirection,
              children: items
                  .map(
                    (String item) => Container(
                      margin: EdgeInsets.all(10.0 * vHeight),
                      height: 40 * vWidth,
                      width: 40 * vWidth,
                      color: Colors.red,
                      child: Center(
                          child: HYText.bigAndBold(
                              title: item, textColor: Colors.white)),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'mainAxisAlignment'),
                      DropdownButton(
                          value: _mainAxisAlignment,
                          items: _mainAxisAlignments
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _mainAxisAlignment = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'mainAxisSize'),
                      DropdownButton(
                          value: _mainAxisSize,
                          items: _mainAxisSizes
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _mainAxisSize = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'crossAxisAlignment'),
                      DropdownButton(
                          value: _crossAxisAlignment,
                          items: _crossAxisAlignments
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _crossAxisAlignment = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'verticalDirection'),
                      DropdownButton(
                          value: _verticalDirection,
                          items: _verticalDirections
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _verticalDirection = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'textBaseline'),
                      DropdownButton(
                          value: _textBaseline,
                          items: _textBaselines
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _textBaseline = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'textDirection'),
                      DropdownButton(
                          value: _textDirection,
                          items: _textDirections
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _textDirection = value)),
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
}

class ColumnPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ColumnPageState();
}

class ColumnPageState extends State<ColumnPage> {
  final List<String> items = ['1', '2', '3', '4'];
  final List<MainAxisAlignment> _mainAxisAlignments = MainAxisAlignment.values;
  final List<MainAxisSize> _mainAxisSizes = MainAxisSize.values;
  final List<CrossAxisAlignment> _crossAxisAlignments =
      CrossAxisAlignment.values;
  final List<VerticalDirection> _verticalDirections = VerticalDirection.values;
  final List<TextBaseline> _textBaselines = TextBaseline.values;
  final List<TextDirection> _textDirections = TextDirection.values;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;
  VerticalDirection _verticalDirection = VerticalDirection.down;
  TextBaseline _textBaseline = TextBaseline.alphabetic;
  TextDirection _textDirection = TextDirection.ltr;
  Section section;

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
        title: 'Column',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: physicalWidth,
            height: 300 * vHeight,
            child: Column(
              textDirection: _textDirection,
              textBaseline: _textBaseline,
              mainAxisAlignment: _mainAxisAlignment,
              mainAxisSize: _mainAxisSize,
              crossAxisAlignment: _crossAxisAlignment,
              verticalDirection: _verticalDirection,
              children: items
                  .map(
                    (String item) => Container(
                      margin: EdgeInsets.all(10.0 * vHeight),
                      height: 40 * vWidth,
                      width: 40 * vWidth,
                      color: Colors.red,
                      child: Center(
                          child: HYText.bigAndBold(
                        title: item,
                        textColor: Colors.white,
                      )),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'mainAxisAlignment'),
                      DropdownButton(
                          value: _mainAxisAlignment,
                          items: _mainAxisAlignments
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _mainAxisAlignment = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'mainAxisSize'),
                      DropdownButton(
                          value: _mainAxisSize,
                          items: _mainAxisSizes
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _mainAxisSize = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'crossAxisAlignment'),
                      DropdownButton(
                          value: _crossAxisAlignment,
                          items: _crossAxisAlignments
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _crossAxisAlignment = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'verticalDirection'),
                      DropdownButton(
                          value: _verticalDirection,
                          items: _verticalDirections
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _verticalDirection = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'textBaseline'),
                      DropdownButton(
                          value: _textBaseline,
                          items: _textBaselines
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _textBaseline = value)),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      HYText(title: 'textDirection'),
                      DropdownButton(
                          value: _textDirection,
                          items: _textDirections
                              .map((item) => DropdownMenuItem(
                                    child: HYText(title: item.toString()),
                                    value: item,
                                  ))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => _textDirection = value)),
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
}
