import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/common/view.dart';
import 'package:flutterapp/models/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeroAnimationPage extends StatelessWidget {
  List<Product> createProductList() {
    List<Product> products = [];
    for (int i = 0; i < 10; i++) {
      products.add(
        Product(
            name: 'Razer巴塞利斯蛇终极版无线游戏电竞专用鼠标RGB底座',
            price: 899,
            location: '北京',
            sales: 999,
            shop: '雷蛇官方旗舰店',
            tags: ['游戏鼠标', '无线鼠标'],
            image: 'assets/images/1.jpg'),
      );
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = createProductList();
    Map arguments = ModalRoute.of(context).settings.arguments;
    Section section = arguments['section'];
    return HYScaffold(
      title: 'Hero',
      section: section,
      body: ListView.builder(
          itemBuilder: (context, index) {
            Product product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/heroAnimationDetailPage',
                    arguments: {'index': index, 'product': product});
              },
              child: Container(
                constraints: BoxConstraints(
                    maxWidth: double.infinity, maxHeight: 150 * vHeight),
                padding: EdgeInsets.only(
                    left: 8 * vWidth, right: 8 * vWidth, top: 10 * vHeight),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 140 * vWidth,
                        height: 140 * vWidth,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8 * vWidth),
                            child: Hero(
                                tag: 'product_image_$index',
                                child: Image.asset(product.image)))),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 8 * vWidth),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            HYText(
                              title: product.name,
                              fontSize: 16,
                              maxLines: 2,
                            ),
                            Container(
                              constraints:
                                  BoxConstraints(maxHeight: 20 * vHeight),
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Container(
                                        child: HYText(
                                          title: product.tags[index],
                                          textColor: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        child: VerticalDivider(
                                          indent: 3.5 * vHeight,
                                          endIndent: 3.5 * vHeight,
                                          thickness: 0.5,
                                          color: Colors.grey,
                                        ),
                                      ),
                                  itemCount: product.tags.length),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage('assets/images/money.png'),
                                  size: 12,
                                  color: Colors.amber,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.0 * vWidth),
                                  child: HYText(
                                    title: product.price.toStringAsFixed(0),
                                    textColor: Colors.amber,
                                    fontSize: 18,
                                    //fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0 * vWidth),
                                  child: HYText(
                                    title: product.sales.toStringAsFixed(0) +
                                        '人付款',
                                    textColor: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                HYText(
                                  fontSize: 13.5,
                                  title: product.shop,
                                  textColor: Colors.grey,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0 * vWidth, right: 2 * vWidth),
                                  child: HYText(
                                    fontSize: 13.5,
                                    title: product.location,
                                  ),
                                ),
                                Container(
                                    child: Center(
                                  child: ImageIcon(
                                    AssetImage('assets/images/arrow_right.png'),
                                    color: Colors.grey,
                                    size: 10 * vWidth,
                                  ),
                                )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: products.length),
    );
  }
}

class HeroAnimationDetailPage extends StatelessWidget {
//  final int index;
//  final Product product;
//
//  const HeroAnimationDetailPage({Key key, this.index, this.product})
//      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;
    Product product = arguments['product'];
    int index = arguments['index'];
    return HYScaffold(
      title: 'Detail',
      body: ListView(
        children: <Widget>[
          Container(
              child: Hero(
                  tag: 'product_image_$index',
                  child: Image.asset(product.image))),
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
                top: 8.0 * vHeight, left: 10 * vWidth, right: 10 * vWidth),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ImageIcon(
                      AssetImage('assets/images/money.png'),
                      size: 12,
                      color: Colors.amber,
                    ),
                    HYText(
                      fontSize: 20,
                      title: product.price.toStringAsFixed(0),
                      textColor: Colors.amber,
                    ),
                  ],
                ),
                HYText(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  title: product.name,
                  maxLines: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 8 * vHeight,
                      bottom: 10 * vHeight,
                      left: 40 * vWidth,
                      right: 40 * vWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 14,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8 * vHeight),
                            child: HYText(
                              title: '推荐',
                              fontSize: 13.5,
                              textColor: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8 * vHeight),
                            child: HYText(
                              title: '27',
                              textColor: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 14,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8 * vHeight),
                            child: HYText(
                              title: '帮我选',
                              fontSize: 13.5,
                              textColor: Colors.grey,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: 10 * vHeight),
            padding: EdgeInsets.only(
                top: 8 * vHeight,
                left: 15 * vWidth,
                right: 15 * vWidth,
                bottom: 8 * vHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                HYText(
                  title: '发货',
                  fontSize: 13.5,
                  textColor: Colors.grey,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.grey,
                    ),
                    HYText(
                      title: product.location,
                      fontSize: 13.5,
                    ),
                    VerticalDivider(color: Colors.blue),
                    Padding(
                      padding: EdgeInsets.only(left: 15 * vWidth),
                      child: HYText(
                        title: '快递：免运费',
                        fontSize: 13.5,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: HYText(
                    title: '月销：' + product.sales.toStringAsFixed(0),
                    fontSize: 13.5,
                    textColor: Colors.grey,
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
