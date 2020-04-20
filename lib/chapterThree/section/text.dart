import 'package:flutter/material.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class TextPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextPageState();
}

class TextPageState extends State<TextPage> {
  int count = 0;
  TextAlign textAlign = TextAlign.center;
  double fontSize = 20;
  FontWeight fontWeight = FontWeight.normal;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final Section section = arguments['section'];
    return Scaffold(
      appBar: HYAppBar(
        title: 'Text',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Center(
              child: HYText(
                title: '$count',
                textAlign: textAlign,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    HYRaisedButton.big(
                        onPressed: () => setState(() => count -= 1),
                        title: '-'),
                    Container(
                        width: physicalWidth / 4.0,
                        child: Center(child: HYText(title: 'Text Value'))),
                    HYRaisedButton.big(
                      onPressed: () => setState(() => count += 1),
                      title: '+',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    HYRaisedButton(
                      title: 'Normal',
                      onPressed: () =>
                          setState(() => fontWeight = FontWeight.normal),
                    ),
                    Container(
                      width: physicalWidth / 4.0,
                      child: Center(child: HYText(title: 'Font Weight')),
                    ),
                    HYRaisedButton(
                      title: 'Bold',
                      onPressed: () =>
                          setState(() => fontWeight = FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  width: physicalWidth / 4.0,
                  child: Center(child: HYText(title: 'Font Size')),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: physicalWidth / 3.0 * 2,
                      child: Center(
                        child: Slider(
                          value: fontSize,
                          label: 'Font Size',
                          max: 200,
                          min: 20,
                          onChanged: (double value) =>
                              setState(() => fontSize = value),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
