import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class StackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StackPageState();
}

class StackPageState extends State<StackPage> {
  Section section;
  final List<AlignmentDirectional> _alignments = [
    AlignmentDirectional.topStart,
    AlignmentDirectional.topCenter,
    AlignmentDirectional.center,
    AlignmentDirectional.centerStart,
    AlignmentDirectional.centerEnd,
    AlignmentDirectional.bottomEnd,
    AlignmentDirectional.bottomStart,
    AlignmentDirectional.bottomCenter,
  ];
  AlignmentDirectional _alignment = AlignmentDirectional.topStart;

  final List<TextDirection> _textDirections = TextDirection.values;
  TextDirection _textDirection = TextDirection.ltr;

  final List<StackFit> _fits = StackFit.values;
  StackFit _fit = StackFit.loose;

  final List<Overflow> _overflows = Overflow.values;
  Overflow _overflow = Overflow.clip;

  final List<Color> items = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.lightGreen
  ];
  double _left = 10 * vWidth;
  double _right = 10 * vWidth;
  double _top = 10 * vHeight;
  double _bottom = 10 * vHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HYAppBar(
          title: 'Stack',
          actions: <Widget>[
            HYIconButton.web(
                onPressed: () => pushToWebView(context, section.url))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 280 * vHeight,
              child: Stack(
                alignment: _alignment,
                textDirection: _textDirection,
                fit: _fit,
                overflow: _overflow,
                children: items.asMap().keys.map((e) {
                  if (e == 0) {
                    return Positioned(
                        top: _top,
                        child: Container(
                          color: items[e],
                          width: 60 * vWidth,
                          height: 60 * vWidth,
                          child: Center(
                            child: HYText(
                              textColor: Colors.white,
                              title: e.toString(),
                            ),
                          ),
                        ));
                  } else if (e == 1) {
                    return Positioned(
                        bottom: _bottom,
                        child: Container(
                          color: items[e],
                          width: 60 * vWidth,
                          height: 60 * vWidth,
                          child: Center(
                            child: HYText(
                              textColor: Colors.white,
                              title: e.toString(),
                            ),
                          ),
                        ));
                  } else if (e == 2) {
                    return Positioned(
                        left: _left,
                        child: Container(
                          color: items[e],
                          width: 60 * vWidth,
                          height: 60 * vWidth,
                          child: Center(
                            child: HYText(
                              textColor: Colors.white,
                              title: e.toString(),
                            ),
                          ),
                        ));
                  } else {
                    return Positioned(
                        right: _right,
                        child: Container(
                          color: items[e],
                          width: 60 * vWidth,
                          height: 60 * vWidth,
                          child: Center(
                            child: HYText(
                              textColor: Colors.white,
                              title: e.toString(),
                            ),
                          ),
                        ));
                  }
                }).toList(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 30 * vHeight),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20 * vWidth),
                      child: HYText.bigAndBold(title: 'Stack'),
                    ),
                    Container(
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
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: <Widget>[
                          HYText(title: 'textDirection'),
                          HYDropdownButton(
                            value: _textDirection,
                            items: _textDirections,
                            onChanged: (value) =>
                                setState(() => _textDirection = value),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: <Widget>[
                          HYText(title: 'fit'),
                          HYDropdownButton(
                            value: _fit,
                            items: _fits,
                            onChanged: (value) => setState(() => _fit = value),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                      child: Wrap(
                        direction: Axis.vertical,
                        children: <Widget>[
                          HYText(title: 'overflow'),
                          HYDropdownButton(
                            value: _overflow,
                            items: _overflows,
                            onChanged: (value) =>
                                setState(() => _overflow = value),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10 * vHeight, left: 20 * vWidth),
                      child: HYText.bigAndBold(title: 'Positioned'),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 30 * vHeight,
                          left: 20 * vWidth,
                          right: 20 * vWidth),
                      child: Wrap(
                        children: <Widget>[
                          HYText(title: 'top: ' + _top.toStringAsFixed(2)),
                          Center(
                            child: Slider(
                              min: 0 * vHeight,
                              max: 220 * vHeight,
                              value: _top,
                              onChanged: (double value) =>
                                  setState(() => _top = value),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 30 * vHeight,
                          left: 20 * vWidth,
                          right: 20 * vWidth),
                      child: Wrap(
                        children: <Widget>[
                          HYText(
                              title: 'bottom: ' + _bottom.toStringAsFixed(2)),
                          Center(
                            child: Slider(
                              min: 0 * vHeight,
                              max: 220 * vHeight,
                              value: _bottom,
                              onChanged: (double value) =>
                                  setState(() => _bottom = value),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 30 * vHeight,
                          left: 20 * vWidth,
                          right: 20 * vWidth),
                      child: Wrap(
                        children: <Widget>[
                          HYText(title: 'left: ' + _left.toStringAsFixed(2)),
                          Center(
                            child: Slider(
                              min: 0 * vWidth,
                              max: physicalWidth - 60 * vWidth,
                              value: _left,
                              onChanged: (double value) =>
                                  setState(() => _left = value),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 30 * vHeight,
                          left: 20 * vWidth,
                          right: 20 * vWidth),
                      child: Wrap(
                        children: <Widget>[
                          HYText(title: 'right: ' + _right.toStringAsFixed(2)),
                          Center(
                            child: Slider(
                              min: 0 * vWidth,
                              max: physicalWidth - 60 * vWidth,
                              value: _right,
                              onChanged: (double value) =>
                                  setState(() => _right = value),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
