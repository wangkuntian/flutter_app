import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class ProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProgressPageState();
}

class ProgressPageState extends State<ProgressPage>
    with SingleTickerProviderStateMixin {
  double value = 0;
  AnimationController controller;
  Animation curve;
  bool isStarted = false;

  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    controller.addListener(() => setState(() => {}));
    curve = CurvedAnimation(parent: controller, curve: Curves.easeInOutQuint);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void start() => setState(() => controller.forward());

  void reverse() => setState(() => controller.reverse());

  void pause() => setState(() => controller.stop());

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final Section section = arguments['section'];

    return Scaffold(
      appBar: HYAppBar(
        title: 'Progress',
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(40 * vWidth),
            child: LinearProgressIndicator(
              value: controller.value,
              valueColor:
                  ColorTween(begin: Colors.lightGreen[300], end: Colors.yellow)
                      .animate(controller),
              backgroundColor: Colors.grey,
            ),
          ),
          Container(
            width: 100 * vWidth,
            height: 100 * vWidth,
            child: CircularProgressIndicator(
              value: curve.value,
              valueColor:
                  ColorTween(begin: Colors.yellow[400], end: Colors.yellow[700])
                      .animate(curve),
              backgroundColor: Colors.grey,
              strokeWidth: 5.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                  child: HYRaisedButton(title: 'Start', onPressed: start)),
              Container(
                  child: HYRaisedButton(title: 'Pause', onPressed: pause)),
              Container(
                  child: HYRaisedButton(title: 'Reverse', onPressed: reverse)),
            ],
          ),
        ],
      ),
    );
  }
}
