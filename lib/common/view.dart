import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterapp/models/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'main.dart';

class HYAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget> actions;

  const HYAppBar({
    Key key,
    this.title,
    this.centerTitle: true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: HYText(
        title: title,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class HYText extends StatelessWidget {
  final String title;
  final Color textColor;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final String fontFamily;

  const HYText(
      {Key key,
      @required this.title,
      this.textColor,
      this.textAlign,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.fontFamily,
      this.textDirection})
      : super(key: key);

  const HYText.section(
      {Key key,
      @required this.title,
      this.textColor,
      this.textAlign,
      this.fontSize: 16.0,
      this.fontStyle,
      this.fontFamily,
      this.fontWeight,
      this.textDirection})
      : super(key: key);

  const HYText.chapter(
      {Key key,
      @required this.title,
      this.textColor,
      this.textAlign,
      this.fontSize: 16.5,
      this.fontWeight,
      this.fontStyle,
      this.fontFamily,
      this.textDirection})
      : super(key: key);

  const HYText.center(
      {Key key,
      @required this.title,
      this.textColor,
      this.textAlign: TextAlign.center,
      this.fontSize,
      this.fontWeight,
      this.fontStyle,
      this.fontFamily,
      this.textDirection})
      : super(key: key);

  const HYText.italic(
      {Key key,
      @required this.title,
      this.textColor,
      this.textAlign,
      this.fontSize,
      this.fontWeight,
      this.fontStyle: FontStyle.italic,
      this.fontFamily,
      this.textDirection})
      : super(key: key);

  const HYText.big(
      {Key key,
      @required this.title,
      this.textColor,
      this.textAlign,
      this.fontSize: 22,
      this.fontWeight: FontWeight.w400,
      this.fontStyle,
      this.fontFamily,
      this.textDirection})
      : super(key: key);

  const HYText.bigAndBold(
      {Key key,
      @required this.title,
      this.textColor,
      this.textAlign,
      this.fontSize: 25,
      this.fontWeight: FontWeight.w600,
      this.fontStyle,
      this.fontFamily,
      this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      textDirection: textDirection,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
      ),
    );
  }
}

class HYIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const HYIcon({Key key, this.icon, this.color}) : super(key: key);

  static const HYIcon arrowRight =
      HYIcon(icon: Icons.keyboard_arrow_right, color: Colors.grey);

  static const HYIcon code = HYIcon(icon: Icons.code, color: Colors.white);

  static const HYIcon web = HYIcon(icon: Icons.web, color: Colors.white);

  static const HYIcon add = HYIcon(icon: Icons.add);

  static const HYIcon done = HYIcon(icon: Icons.done);

  static const HYIcon star = HYIcon(icon: Icons.star);

  static const HYIcon stars = HYIcon(icon: Icons.stars);

  static const HYIcon starHalf = HYIcon(icon: Icons.star_half);

  static const HYIcon starBorder = HYIcon(icon: Icons.star_border);

  static const HYIcon eye = HYIcon(icon: FontAwesomeIcons.eye);

  static const HYIcon eyeClosed = HYIcon(icon: FontAwesomeIcons.eyeSlash);

  static const HYIcon setting = HYIcon(icon: Icons.settings);

  static const HYIcon language = HYIcon(icon: Icons.language);

  static const HYIcon theme = HYIcon(icon: Icons.color_lens);

  static const HYIcon check =
      HYIcon(icon: FontAwesomeIcons.checkCircle, color: Colors.white);

  static const HYIcon camera = HYIcon(icon: Icons.photo_camera);

  static const HYIcon gallery = HYIcon(icon: Icons.photo);

  static const HYIcon warning = HYIcon(icon: Icons.warning);

  @override
  Widget build(BuildContext context) {
    return FaIcon(icon, color: color);
  }
}

class HYAnimatedIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedIcon(
      icon: AnimatedIcons.add_event,
      progress: null,
    );
  }
}

class HYIconButton extends StatelessWidget {
  final HYIcon icon;
  final VoidCallback onPressed;

  const HYIconButton({Key key, this.icon, this.onPressed}) : super(key: key);

  const HYIconButton.code({Key key, this.icon: HYIcon.code, this.onPressed})
      : super(key: key);

  const HYIconButton.web({Key key, this.icon: HYIcon.web, this.onPressed})
      : super(key: key);

  const HYIconButton.add({Key key, this.icon: HYIcon.add, this.onPressed})
      : super(key: key);

  const HYIconButton.done({Key key, this.icon: HYIcon.done, this.onPressed})
      : super(key: key);

  const HYIconButton.star({Key key, this.icon: HYIcon.star, this.onPressed})
      : super(key: key);

  const HYIconButton.stars({Key key, this.icon: HYIcon.stars, this.onPressed})
      : super(key: key);

  const HYIconButton.starHalf(
      {Key key, this.icon: HYIcon.starHalf, this.onPressed})
      : super(key: key);

  const HYIconButton.starBorder(
      {Key key, this.icon: HYIcon.starBorder, this.onPressed})
      : super(key: key);

  const HYIconButton.eye({Key key, this.icon: HYIcon.eye, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
    );
  }
}

class HYFlatButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const HYFlatButton({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: HYText(title: title),
      onPressed: onPressed,
    );
  }
}

class HYRaisedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final HYIcon icon;
  final double fontSize;

  const HYRaisedButton(
      {Key key, this.title, this.onPressed, this.icon, this.fontSize})
      : super(key: key);

  const HYRaisedButton.big(
      {Key key, this.icon, this.onPressed, this.title, this.fontSize: 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: HYText(title: title, fontSize: fontSize),
      onPressed: onPressed,
    );
  }
}

class HYOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  const HYOutlineButton({Key key, this.onPressed, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: HYText(title: title),
      onPressed: onPressed,
    );
  }
}

class HYDivider extends StatelessWidget {
  final Color color;

  const HYDivider({Key key, this.color: Colors.lightGreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(color: color);
  }
}

class HYWebView2 extends StatelessWidget {
  final String url;

  const HYWebView2({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: url, javascriptMode: JavascriptMode.unrestricted);
  }
}

class HYWebView extends StatelessWidget {
  final String url;

  const HYWebView({Key key, this.url}) : super(key: key);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      hidden: true,
      withLocalStorage: true,
      initialChild: Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      url: url,
      appBar: HYAppBar(
        title: '网页',
        actions: <Widget>[
          HYIconButton.web(
            onPressed: () {
              _launchURL(url);
            },
          )
        ],
      ),
    );
  }
}

typedef IndexedWidgetCallBack = void Function(int index);

class HYSectionListView extends StatelessWidget {
  final String title;
  final List<Section> sections;
  final IndexedWidgetCallBack onTap;

  const HYSectionListView({Key key, this.title, this.sections, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(title: title),
      body: Center(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              Section section = sections[index];
              return ListTile(
                  title: HYText.section(title: section.section),
                  trailing: HYIcon.arrowRight,
                  onTap: () {
                    onTap(index);
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return HYDivider();
            },
            itemCount: sections.length),
      ),
    );
  }
}

class HYChapterListView extends StatelessWidget {
  final List<Chapter> chapters;
  final IndexedWidgetCallBack onTap;

  const HYChapterListView({Key key, this.chapters, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          Chapter chapter = chapters[index];
          return ListTile(
              title: HYText.chapter(title: chapter.chapter),
              trailing: HYIcon.arrowRight,
              onTap: () {
                onTap(index);
              });
        },
        separatorBuilder: (BuildContext context, int index) {
          return HYDivider();
        },
        itemCount: chapters.length);
  }
}

class HYCommonListView extends StatelessWidget {
  final List<String> items;
  final List<String> routes;
  final Section section;
  final String title;

  const HYCommonListView(
      {Key key, this.items, this.routes, this.section, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(title: title),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: HYText(title: items[index]),
                trailing: HYIcon.arrowRight,
                onTap: () => Navigator.pushNamed(context, routes[index],
                    arguments: {'section': section}),
              ),
          separatorBuilder: (context, index) => HYDivider(),
          itemCount: items.length),
    );
  }
}

typedef WidgetBuilderCallBack = Widget Function(AsyncSnapshot snapshot);

class HYFutureBuilder extends StatelessWidget {
  final String url;
  final WidgetBuilderCallBack connectionStateDone;

  const HYFutureBuilder({Key key, this.url, this.connectionStateDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(url),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.none:
            return Text('');
          case ConnectionState.active:
            return Text('');
          case ConnectionState.done:
            return connectionStateDone(snapshot);
          default:
            return null;
        }
      },
    );
  }
}

class HYAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const HYAlertDialog({Key key, this.title, this.content, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: HYText(title: title, fontSize: 20),
      content: HYText(title: content),
      actions: actions,
    );
  }
}

class HYDropdownButton<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final ValueChanged onChanged;

  const HYDropdownButton({Key key, this.value, this.items, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      onChanged: onChanged,
      items: items
          .map((item) => DropdownMenuItem(
              value: item, child: HYText(title: item.toString())))
          .toList(),
    );
  }
}

typedef IndexValueChanged = void Function(int index, double value);

class TransformView extends StatelessWidget {
  final Widget child;
  final String title;
  final List<String> items;
  final List<double> values;
  final double limit;
  final IndexValueChanged onChanged;

  const TransformView(
      {Key key,
      this.title,
      this.items,
      this.values,
      this.limit,
      this.onChanged,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Container(
                height: 180 * vWidth,
                width: 180 * vWidth,
                color: Colors.blue[100],
                child: child),
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20 * vWidth),
                child: HYText.bigAndBold(title: title),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 30 * vHeight, left: 20 * vWidth, right: 20 * vWidth),
                child: Wrap(
                    spacing: 20 * vWidth,
                    children: items
                        .asMap()
                        .keys
                        .map((index) => Wrap(
                              children: <Widget>[
                                HYText(
                                    title: items[index] +
                                        ': ' +
                                        values[index].toStringAsFixed(2)),
                                Center(
                                  child: Slider(
                                      value: values[index],
                                      max: limit,
                                      onChanged: (value) =>
                                          onChanged(index, value)),
                                )
                              ],
                            ))
                        .toList()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
