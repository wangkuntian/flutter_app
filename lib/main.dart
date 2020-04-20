import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/drawer.dart';
import 'package:flutterapp/theme.dart';
import 'package:provider/provider.dart';
import 'common/main.dart';
import 'models/index.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeModel())],
      child: Consumer<ThemeModel>(
        builder: (context, theme, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: AppTheme.getThemeData(theme.getTheme()),
            home: MyHomePage(title: 'Flutter实战'),
            routes: routes,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Chapter> chapters = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HYAppBar(title: widget.title, centerTitle: false),
        drawer: MyDrawer(),
        body: HYFutureBuilder(
          url: 'assets/flutter.json',
          connectionStateDone: (AsyncSnapshot snapshot) {
            final jsonData = json.decode(snapshot.data.toString());
            chapters = [];
            for (var chapterJson in jsonData) {
              var chapter = Chapter.init(chapterJson['chapter']);
              for (var sectionJson in chapterJson['sections']) {
                chapter.sections.add(Section.init(
                  sectionJson['section'],
                  sectionJson['url'],
                  sectionJson['page'],
                ));
              }
              chapters.add(chapter);
            }

            return Center(
              child: HYChapterListView(
                  chapters: chapters,
                  onTap: (int index) {
                    final chapter = chapters[index];
                    Navigator.pushNamed(
                      context,
                      '/sectionListPage',
                      arguments: {
                        'title': chapter.chapter,
                        'sections': chapter.sections
                      },
                    );
                  }),
            );
          },
        ));
  }
}
