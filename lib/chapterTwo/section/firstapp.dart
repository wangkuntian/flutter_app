import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class FirstAppPage extends StatefulWidget {
  FirstAppPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FirstAppPageState();

  final String title;
}

class FirstAppPageState extends State<FirstAppPage> {
  Section section;
  Map arguments;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() => _counter++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(
        title: widget.title,
        actions: <Widget>[
          HYIconButton.web(
              onPressed: () => pushToWebView(context, section.url)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
