import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapp/common/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ShopPageState();
}

class ShopPageState extends State<ShopPage> {
  ScrollController _controller = ScrollController();
  final List shops = [1, 2, 3, 4];
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    _initItems();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        if (items.length + 20 <= 100) {
          loadMore();
        }
      }
    });
  }

  void _initItems() {
    String path = 'assets/images/beach_';
    for (var i = 0; i < 20; i++) {
      items.add(path + (Random().nextInt(5) + 1).toString() + '.jpg');
    }
  }

  void loadMore() {
    Future.delayed(Duration(seconds: 2)).then((v) {
      String path = 'assets/images/beach_';
      for (var i = 0; i < 20; i++) {
        items.add(path + (Random().nextInt(5) + 1).toString() + '.jpg');
      }
      setState(() {});
    });
  }

  Widget getHeader() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/beach.jpg'),
          Padding(
            padding: EdgeInsets.only(
                left: 26 * vWidth,
                right: 26 * vWidth,
                top: 10 * vHeight,
                bottom: 10 * vHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: getShops(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 26 * vWidth, right: 26 * vWidth, top: 10 * vHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: getShops(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getShops() {
    return shops.map((item) {
      return Container(
        child: Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Container(
              width: 45 * vWidth,
              height: 45 * vWidth,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: HYIcon(
                  icon: FontAwesomeIcons.shopify,
                ),
              ),
            ),
            HYText(title: 'Shop')
          ],
        ),
      );
    }).toList();
  }

  Widget getItem(String item) {
    return Container(
      margin: EdgeInsets.only(top: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8 * vWidth),
      ),
      child: Wrap(
        direction: Axis.vertical,
        spacing: 5 * vHeight,
        children: <Widget>[
          Container(
              width: (physicalWidth - 24) / 2,
              height: (physicalWidth - 24) / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8 * vWidth),
                    topRight: Radius.circular(8 * vWidth)),
                child: Image.asset(
                  item,
                  fit: BoxFit.fill,
                ),
              )),
          Container(
              padding: EdgeInsets.only(left: 5 * vWidth),
              child: HYText(title: 'Test')),
          Container(
              padding: EdgeInsets.only(left: 5 * vWidth),
              child: HYText.bigAndBold(title: '20.0'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: HYAppBar(title: '首页'),
        body: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: StaggeredGridView.countBuilder(
            controller: _controller,
            crossAxisCount: 4,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              if (items.length - 1 == index) {
                if (items.length >= 100) {
                  return Container(
                    alignment: Alignment.center,
                    child: HYText(title: '没有更多了'),
                  );
                } else {
                  return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                }
              }
              return getItem(items[index]);
            },
            staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
        ));
  }
}
