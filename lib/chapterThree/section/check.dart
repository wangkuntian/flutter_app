import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class CheckPage extends StatefulWidget {
  final String title = 'Check';

  @override
  State<StatefulWidget> createState() => CheckPageState();
}

class CheckPageState extends State<CheckPage> {
  bool switchValue = true;
  bool checkValue = true;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final Section section = arguments['section'];
    return Scaffold(
      appBar: HYAppBar(
        title: widget.title,
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HYText(title: 'Switch'),
              Switch(
                value: switchValue,
                onChanged: (value) => setState(() => switchValue = value),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HYText(title: 'Checkbox'),
              Checkbox(
                value: checkValue,
                onChanged: (value) => setState(() => checkValue = value),
              ),
            ],
          )
        ],
      ),
    );
  }
}
