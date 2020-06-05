import 'package:flutter/material.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

//class AnimatedDecoratedBox extends StatefulWidget {
//  final BoxDecoration decoration;
//  final Widget child;
//  final Duration duration;
//  final Curve curve;
//  final Duration reverseDuration;
//
//  const AnimatedDecoratedBox(
//      {Key key,
//      @required this.decoration,
//      @required this.duration,
//      this.curve,
//      this.reverseDuration,
//      this.child})
//      : super(key: key);
//
//  @override
//  State<StatefulWidget> createState() => AnimatedDecoratedBoxState();
//}
//
//class AnimatedDecoratedBoxState extends State<AnimatedDecoratedBox>
//    with SingleTickerProviderStateMixin {
//  @protected
//  AnimationController get controller => _controller;
//  AnimationController _controller;
//
//  Animation<double> get animation => _animation;
//  Animation<double> _animation;
//
//  DecorationTween _tween;
//
//  @override
//  void initState() {
//    super.initState();
//    _controller = AnimationController(
//      duration: widget.duration,
//      reverseDuration: widget.reverseDuration,
//      vsync: this,
//    );
//    _tween = DecorationTween(begin: widget.decoration);
//
//    updateCurve();
//  }
//
//  void updateCurve() {
//    if (widget.curve != null) {
//      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
//    } else {
//      _animation = _controller;
//    }
//  }
//
//  @override
//  void didUpdateWidget(AnimatedDecoratedBox oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    if (widget.curve != oldWidget.curve) updateCurve();
//
//    _controller.duration = widget.duration;
//    _controller.reverseDuration = widget.reverseDuration;
//
//    if (widget.decoration != (_tween.end ?? _tween.begin)) {
//      _tween
//        ..begin = _tween.evaluate(_animation)
//        ..end = widget.decoration;
//
//      _controller
//        ..value = 0.0
//        ..forward();
//    }
//  }
//
//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      animation: _animation,
//      builder: (context, child) => DecoratedBox(
//        decoration: _tween.animate(_animation).value,
//        child: child,
//      ),
//      child: widget.child,
//    );
//  }
//}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  final BoxDecoration decoration;
  final Widget child;

  AnimatedDecoratedBox(
      {Key key,
      @required this.decoration,
      this.child,
      Curve curve = Curves.linear,
      @required Duration duration,
      Duration reverseDuration})
      : super(
          key: key,
          curve: curve,
          duration: duration,
        );

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      AnimatedDecoratedBoxState();
}

class AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decorationTween;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decorationTween.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _decorationTween = visitor(_decorationTween, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimationPageState();
}

class AnimationPageState extends State<AnimationPage> {
  Duration duration = Duration(seconds: 1);
  Color decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return HYScaffold(
      title: '自定义',
      body: Center(
        child: AnimatedDecoratedBox(
          decoration: BoxDecoration(color: decorationColor),
          duration:
              Duration(milliseconds: decorationColor == Colors.red ? 400 : 200),
          child: FlatButton(
            onPressed: () => setState(() => decorationColor =
                decorationColor == Colors.blue ? Colors.red : Colors.blue),
            child: Text(
              'AnimatedDecoratedBox',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPaddingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedPaddingPageState();
}

class AnimatedPaddingPageState extends State<AnimatedPaddingPage> {
  Section section;
  double padding = 10 * vHeight;
  Duration duration = Duration(seconds: 1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return HYScaffold(
      title: 'AnimatedPadding',
      section: section,
      body: HYStageView(
        stage: Center(
          child: RaisedButton(
            onPressed: () => setState(() => padding += 5 * vHeight),
            child: AnimatedPadding(
              padding: EdgeInsets.all(padding),
              duration: duration,
              child: HYText(
                title: '$padding',
                textColor: Colors.white,
              ),
              onEnd: () {
                print(padding);
                if (padding >= 100 * vHeight) {
                  setState(() {
                    padding = 10 * vHeight;
                  });
                }
              },
            ),
          ),
        ),
        children: <Widget>[],
        title: 'AnimatedPadding',
      ),
    );
  }
}

class AnimatedPositionedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedPositionedPageState();
}

class AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  Section section;
  List<double> directions = [0, 0];
  Duration duration = Duration(seconds: 1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return HYScaffold(
      title: 'AnimatedPosition',
      section: section,
      body: HYStageView(
        stage: Center(
          child: Container(
            width: physicalWidth,
            height: 320 * vWidth,
            padding: EdgeInsets.all(10 * vWidth),
            child: SizedBox(
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    left: directions[0],
                    top: directions[1],
                    duration: duration,
                    child: Container(
                        width: 40 * vWidth,
                        height: 40 * vWidth,
                        padding: EdgeInsets.all(5 * vWidth),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(5 * vWidth),
                        ),
                        child: Center(
                          child: HYText(
                            title: '❤',
                            fontSize: 20,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        children: <Widget>[
          HYIconButton.up(
            onPressed: () {
              setState(() {
                if (directions[1] >= 10 * vHeight) {
                  directions[1] -= 10 * vHeight;
                }
              });
            },
          ),
          HYIconButton.left(
            onPressed: () {
              setState(() {
                if (directions[0] >= 10 * vHeight) {
                  directions[0] -= 10 * vHeight;
                }
              });
            },
          ),
          HYIconButton.down(
            onPressed: () {
              setState(() {
                if (directions[1] <= 250 * vHeight) {
                  directions[1] += 10 * vHeight;
                }
              });
            },
          ),
          HYIconButton.right(
            onPressed: () {
              setState(() {
                if (directions[0] <= 290 * vHeight) {
                  directions[0] += 10 * vHeight;
                }
              });
            },
          ),
          HYIconButton.restore(
            onPressed: () {
              setState(() {
                directions = [0, 0];
              });
            },
          )
        ],
        title: 'AnimatedPositioned',
        direction: Axis.horizontal,
      ),
    );
  }
}

class AnimatedOpacityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedOpacityPageState();
}

class AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  Section section;
  double opacity = 0.0;
  Duration duration = Duration(seconds: 1);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return HYScaffold(
      title: 'AnimatedPosition',
      section: section,
      body: HYStageView(
        stage: Center(
          child: AnimatedOpacity(
            opacity: opacity,
            duration: duration,
            child: Container(
                padding: EdgeInsets.all(5 * vWidth),
                child: HYText(
                  title: '❤',
                  fontSize: 40,
                )),
          ),
        ),
        children: <Widget>[
          HYText(title: 'opacity'),
          Slider(
              value: opacity,
              onChanged: (value) => setState(() => opacity = value))
        ],
        title: 'AnimatedOpacity',
      ),
    );
  }
}

class AnimatedAlignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedAlignPageState();
}

class AnimatedAlignPageState extends State<AnimatedAlignPage> {
  Section section;
  Alignment alignment = Alignment.center;
  List<Alignment> alignments = [
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ];
  Duration duration = Duration(microseconds: 1500);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return HYScaffold(
      title: 'AnimatedPosition',
      section: section,
      body: HYStageView(
        stage: Center(
          child: Container(
            padding: EdgeInsets.all(20 * vWidth),
            child: AnimatedAlign(
              alignment: alignment,
              duration: duration,
              child: Container(
                  padding: EdgeInsets.all(5 * vWidth),
                  child: HYText(
                    title: '❤',
                    fontSize: 40,
                  )),
            ),
          ),
        ),
        children: <Widget>[
          HYText(title: 'alignment'),
          HYDropdownButton(
            value: alignment,
            items: alignments,
            onChanged: (value) => setState(() => alignment = value),
          )
        ],
        title: 'AnimatedAlign',
      ),
    );
  }
}

class AnimatedContainerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedContainerPageState();
}

class AnimatedContainerPageState extends State<AnimatedContainerPage> {
  Section section;
  Alignment alignment = Alignment.center;
  List<Alignment> alignments = [
    Alignment.topCenter,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ];
  Duration duration = Duration(microseconds: 1500);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) {
    return HYScaffold(
      title: 'AnimatedPosition',
      section: section,
      body: HYStageView(
        stage: Center(
          child: Container(
            padding: EdgeInsets.all(20 * vWidth),
            child: AnimatedContainer(
              alignment: alignment,
              duration: duration,
              child: Container(
                  padding: EdgeInsets.all(5 * vWidth),
                  child: HYText(
                    title: '❤',
                    fontSize: 40,
                  )),
            ),
          ),
        ),
        children: <Widget>[
          HYText(title: 'alignment'),
          HYDropdownButton(
            value: alignment,
            items: alignments,
            onChanged: (value) => setState(() => alignment = value),
          )
        ],
        title: 'AnimatedContainer',
      ),
    );
  }
}
