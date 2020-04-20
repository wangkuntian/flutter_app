import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class ImagePage extends StatelessWidget {
  final List<BoxFit> items = [
    BoxFit.contain,
    BoxFit.cover,
    BoxFit.fill,
    BoxFit.fitHeight,
    BoxFit.fitWidth,
    BoxFit.scaleDown,
    BoxFit.none
  ];

  Widget createItem(int index) {
    return Container(
      margin: EdgeInsets.all(10 * vHeight),
      height: 200 * vHeight,
      child: Padding(
        padding: EdgeInsets.only(left: 10 * vWidth, right: 10 * vWidth),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HYText(title: 'Asset'),
                Image.asset(
                  'assets/images/fox.png',
                  height: 150 * vWidth,
                  width: 150 * vWidth,
                  fit: items[index],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20 * vWidth, right: 20 * vWidth),
              child: Center(
                child: HYText(
                  title: items[index].toString(),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HYText(title: 'Network'),
                Image.network(
                  'https://picography.co/wp-content/uploads/2019/11/picography-cat-wearing-bow-600x400.jpg',
                  height: 150 * vWidth,
                  width: 150 * vWidth,
                  fit: items[index],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final Section section = arguments['section'];

    return Scaffold(
        appBar: HYAppBar(
          title: 'Image',
          actions: <Widget>[
            HYIconButton.web(
                onPressed: () => pushToWebView(context, section.url))
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => createItem(index),
            separatorBuilder: (context, index) => HYDivider(),
            itemCount: items.length));
  }
}
