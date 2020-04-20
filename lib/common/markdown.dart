import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutterapp/common/view.dart';

class MarkDownPage extends StatefulWidget {
  MarkDownPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => MarkDownPageState();
}

class MarkDownPageState extends State<MarkDownPage> {
  Map arguments;
  String loadPath;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context).settings.arguments;
    loadPath = arguments['path'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(title: widget.title),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(loadPath),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Markdown(data: snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
