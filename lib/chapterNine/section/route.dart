import 'package:flutter/material.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HYScaffold(
        title: 'Test', body: Center(child: HYText.bigAndBold(title: 'Test')));
  }
}

class RouteAnimatedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RouteAnimatedPageSate();
}

class RouteAnimatedPageSate extends State<RouteAnimatedPage> {
  double duration = 1.0;
  List<double> durations = [0.1, 0.2, 0.3, 0.5, 0.6, 0.8, 1, 1.5, 2];
  int index = 0;
  List<String> types = ['Fade', 'Scale', 'Rotation And Scale', 'Slide'];

  Map<String, Curve> curves = {
    'Linear': Curves.linear,
    'Ease In': Curves.easeIn,
    'Fast Out Slow In': Curves.fastOutSlowIn,
  };

  String curve = 'Fast Out Slow In';

  @override
  void initState() {
    super.initState();
  }

  Widget builder(int index, BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Curve curve) {
    if (index == 0) {
      return FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(parent: animation, curve: curve)),
        child: Test(),
      );
    } else if (index == 1) {
      return ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(parent: animation, curve: curve)),
        child: Test(),
      );
    } else if (index == 2) {
      return RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(parent: animation, curve: curve)),
        child: ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0)
              .animate(CurvedAnimation(parent: animation, curve: curve)),
          child: Test(),
        ),
      );
    } else if (index == 3) {
      return SlideTransition(
        position: Tween<Offset>(
                // 设置滑动的 X , Y 轴
                begin: Offset(-1.0, 0.0),
                end: Offset(0.0, 0.0))
            .animate(CurvedAnimation(parent: animation, curve: curve)),
        child: Test(),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    Section section = arguments['section'];
    return HYScaffold(
      title: 'PageRouteBuilder',
      section: section,
      body: HYStageView(
        title: 'Route',
        stage: Center(
          child: HYRaisedButton(
            title: 'Press me',
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration:
                      Duration(milliseconds: (duration * 1000).toInt()),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return builder(index, context, animation,
                        secondaryAnimation, curves[curve]);
                  },
                ),
              );
            },
          ),
        ),
        children: [
          Wrap(
            spacing: 8 * vWidth,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              HYText(
                title: 'Duration: ',
              ),
              HYDropdownButton(
                value: duration,
                items: durations,
                onChanged: (value) => setState(() => duration = value),
              ),
              HYText(title: 's'),
            ],
          ),
          Wrap(
            spacing: 8 * vWidth,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              HYText(
                title: 'Curve: ',
              ),
              HYDropdownButton(
                value: curve,
                items: curves.keys.toList(),
                onChanged: (value) => setState(() => curve = value),
              ),
            ],
          ),
          Wrap(
            spacing: 8 * vWidth,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              HYText(
                title: 'Animation: ',
              ),
              HYDropdownButton(
                value: types[index],
                items: types,
                onChanged: (value) => setState(() {
                  index = types.indexOf(value);
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
