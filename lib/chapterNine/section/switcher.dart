import 'package:flutter/material.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

// ignore: must_be_immutable
class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position) {
    switch (direction) {
      case AxisDirection.up:
        tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;
  final bool transformHitTests;
  final Widget child;
  final AxisDirection direction;
  Tween<Offset> tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      if (direction == AxisDirection.up || direction == AxisDirection.down) {
        offset = Offset(offset.dx, -offset.dy);
      } else {
        offset = Offset(-offset.dx, offset.dy);
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

class SwitcherAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SwitcherAnimationPageState();
}

class SwitcherAnimationPageState extends State<SwitcherAnimationPage> {
  Section section;
  List<int> counts = [0, 0, 0, 0];
  List<AxisDirection> directions = AxisDirection.values;
  AxisDirection direction = AxisDirection.down;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return HYScaffold(
      title: 'AnimatedSwitcher',
      section: section,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 10 * vWidth,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) =>
                                ScaleTransition(
                          child: child,
                          scale: animation,
                        ),
                        child: HYText(
                          title: counts[0].toString(),
                          key: ValueKey<int>(counts[0]),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10 * vHeight),
                        child: HYRaisedButton(
                          title: '+ 1',
                          onPressed: () => setState(() => counts[0] += 1),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          Tween<Offset> tween = Tween<Offset>(
                              begin: Offset(1, 0), end: Offset(0, 0));
                          return SlideTransition(
                              position: tween.animate(animation), child: child);
                        },
                        child: HYText(
                          title: counts[1].toString(),
                          key: ValueKey<int>(counts[1]),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10 * vHeight),
                        child: HYRaisedButton(
                          title: '+ 1',
                          onPressed: () => setState(() => counts[1] += 1),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          Tween<Offset> tween = Tween<Offset>(
                              begin: Offset(1, 0), end: Offset(0, 0));
                          return MySlideTransition(
                              position: tween.animate(animation), child: child);
                        },
                        child: HYText(
                          title: counts[2].toString(),
                          key: ValueKey<int>(counts[2]),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10 * vHeight),
                        child: HYRaisedButton(
                          title: '+ 1',
                          onPressed: () => setState(() => counts[2] += 1),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30 * vHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) =>
                            SlideTransitionX(
                                position: animation,
                                direction: direction,
                                child: child),
                    child: HYText(
                      title: counts[3].toString(),
                      key: ValueKey<int>(counts[3]),
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10 * vHeight),
                    child: HYRaisedButton(
                      title: '+ 1',
                      onPressed: () => setState(() => counts[3] += 1),
                    ),
                  )
                ],
              ),
            ),
            HYDropdownButton(
              value: direction,
              items: directions,
              onChanged: (value) => setState(() => direction = value),
            )
          ],
        ),
      ),
    );
  }
}
