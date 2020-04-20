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
        body: Stack(
          children: <Widget>[],
        ),
      );
}
