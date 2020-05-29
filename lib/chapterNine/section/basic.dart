import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/common/view.dart';
import 'package:flutterapp/models/index.dart';

class BasicAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BasicAnimationPageState();
}

class BasicAnimationPageState extends State<BasicAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  Section section;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween(begin: 0.0, end: 300.0 * vWidth).animate(_controller)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => HYScaffold(
        title: 'Basic',
        section: section,
        body: Center(
          child: Image.asset(
            'assets/images/sky.png',
            width: _animation.value,
            height: _animation.value,
          ),
        ),
      );
}

class CurveAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CurveAnimationPageState();
}

class CurveAnimationPageState extends State<CurveAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  Section section;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _animation = Tween(begin: 0.0, end: 300.0 * vWidth).animate(_controller)
      ..addListener(() => setState(() {}))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => HYScaffold(
        title: 'Curve',
        section: section,
        body: Center(
          child: Image.asset(
            'assets/images/sky.png',
            width: _animation.value,
            height: _animation.value,
          ),
        ),
      );
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = listenable;
    return Center(
      child: Image.asset(
        'assets/images/sky.png',
        width: _animation.value,
        height: _animation.value,
      ),
    );
  }
}

class AnimatedWidgetPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedWidgetPageState();
}

class AnimatedWidgetPageState extends State<AnimatedWidgetPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  Section section;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _animation = Tween(begin: 0.0, end: 300.0 * vWidth).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => HYScaffold(
        title: 'AnimatedWidget',
        section: section,
        body: AnimatedImage(animation: _animation),
      );
}

class AnimatedBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedBuilderPageState();
}

class AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  Section section;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _animation = Tween(begin: 0.0, end: 300.0 * vWidth).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => HYScaffold(
        title: 'AnimatedBuilder',
        section: section,
        body: AnimatedBuilder(
          animation: _animation,
          child: Image.asset('assets/images/sky.png'),
          builder: (BuildContext context, Widget child) => Center(
            child: Container(
              width: _animation.value,
              height: _animation.value,
              child: child,
            ),
          ),
        ),
      );
}
