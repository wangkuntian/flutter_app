import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class CommonSectionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    List<Section> sections = arguments['sections'];
    List<String> routes = arguments['routes'];
    String title = arguments['title'];

    return Scaffold(
      appBar: HYAppBar(title: title),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: HYText(title: sections[index].section),
                trailing: HYIcon.arrowRight,
                onTap: () {
                  if (routes[index] == '') {
                    pushToWebView(context, sections[index].url);
                  } else {
                    Navigator.pushNamed(context, routes[index],
                        arguments: {'section': sections[index]});
                  }
                },
              ),
          separatorBuilder: (context, index) => HYDivider(),
          itemCount: sections.length),
    );
  }
}
