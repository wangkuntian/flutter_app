import 'package:flutter/material.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

// ignore: must_be_immutable
class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<Color> color;
  Animation<EdgeInsets> padding;

  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
          parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)),
    );
    color = ColorTween(begin: Colors.lightGreen, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)));

    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: 0),
            end: EdgeInsets.only(left: 100 * vWidth))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Container(
          alignment: Alignment.bottomCenter,
          padding: padding.value,
          child: Container(
            color: color.value,
            width: 50 * vWidth,
            height: height.value,
          ),
        );
      },
      animation: controller,
    );
  }
}

class StaggerAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StaggerAnimationPageState();
}

class StaggerAnimationPageState extends State<StaggerAnimationPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  Section section;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return HYScaffold(
      title: 'Stagger',
      section: section,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          try {
            await controller.forward().orCancel;
            await controller.reverse().orCancel;
          } on TickerCanceled {}
        },
        child: Center(
          child: Container(
              width: 300 * vWidth,
              height: 300 * vWidth,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  border: Border.all(color: Colors.black.withOpacity(0.5))),
              child: StaggerAnimation(controller: controller)),
        ),
      ),
    );
  }
}
