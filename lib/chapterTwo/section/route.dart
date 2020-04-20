import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/common/view.dart';
import 'package:flutterapp/models/index.dart';

class RouteControlListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final List<Section> sections = arguments['sections'];
    final String title = arguments['title'];
    return HYSectionListView(
      title: title,
      sections: sections,
      onTap: (int index) {
        final section = sections[index];
        if (index == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      RoutePage(title: '路由', section: section)));
        } else if (index == 1) {
          Navigator.pushNamed(context, '/routePassValuePage',
              arguments: {'title': section.section, 'section': section});
        }
      },
    );
  }
}

class NewRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(title: 'Hello World'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HYText.big(title: "Weclome To Flutter's World"),
            HYText(title: "You Can Press The Button Below To Pop Back"),
            HYRaisedButton(
              title: 'Navigator Pop',
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutePage extends StatelessWidget {
  final String title;
  final Section section;

  const RoutePage({Key key, this.title, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(
        title: title,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.web,
              color: Colors.white,
            ),
            tooltip: '网页',
            onPressed: () => pushToWebView(context, section.url),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HYRaisedButton(
              title: 'Navigator Push',
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewRoutePage())),
            ),
            HYRaisedButton(
              title: 'Navigator Push Named',
              onPressed: () => Navigator.pushNamed(context, '/newRoutePage'),
            )
          ],
        ),
      ),
    );
  }
}

class RoutePassValuePage extends StatefulWidget {
  RoutePassValuePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RoutePassValuePageState();
}

class RoutePassValuePageState extends State<RoutePassValuePage> {
  TextEditingController valueController = TextEditingController();
  Section section;
  String title;
  Map arguments;
  String value = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
    title = arguments['title'];
  }

  void showAlert() => showAlertDialog(
        context,
        title: 'Warning',
        content: 'Value Can Not Be Empty',
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(
        title: title,
        actions: <Widget>[
          HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
        ],
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HYText(title: 'The value is'),
            HYText.big(title: value),
            TextField(
              controller: valueController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Type The Vaule You Want to Pass',
                prefixIcon: Icon(Icons.title),
              ),
              onChanged: (item) => setState(() => value = item),
            ),
            HYRaisedButton(
              onPressed: () {
                if (valueController.text.trim() == '') {
                  showAlert();
                  return;
                }

                Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            RouteValuePage(value: valueController.text))).then(
                    (String result) => showAlertDialog(context,
                        title: 'Value', content: 'The value is: $result'));
              },
              title: 'Navigator Push',
            ),
            HYRaisedButton(
              onPressed: () {
                if (valueController.text.trim() == '') {
                  showAlert();
                  return;
                }

                Navigator.pushNamed(
                  context,
                  '/routeValuePage',
                  arguments: {'value': valueController.text},
                ).then((result) => showAlertDialog(context,
                    title: 'Value', content: 'The value is: $result'));
              },
              title: 'Navigator Push Named',
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RouteValuePage extends StatelessWidget {
  RouteValuePage({Key key, this.value}) : super(key: key);
  String value;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null) {
      value = arguments['value'];
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Value',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Align(
        alignment: Alignment(1, 0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HYText(title: 'The value is:'),
                HYText.big(title: '$value'),
                HYRaisedButton(
                  title: 'Return The Value And Back',
                  onPressed: () => Navigator.pop(context, value),
                )
              ]),
        ),
      ),
    );
  }
}
