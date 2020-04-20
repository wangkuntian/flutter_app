import 'package:flutter/material.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final Section section = arguments['section'];

    Widget iconButtonContainer = Container(
      margin: EdgeInsets.all(20 * vHeight),
      child: Column(
        children: <Widget>[
          HYText(title: 'IconButton'),
          Container(
            height: 60,
            padding: EdgeInsets.only(top: 20 * vHeight),
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: 65 * vWidth,
              children: <Widget>[
                HYIconButton.starBorder(onPressed: () {}),
                HYIconButton.starHalf(onPressed: () {}),
                HYIconButton.star(onPressed: () {}),
                HYIconButton.stars(onPressed: () {}),
                HYIconButton.add(onPressed: () {}),
                HYIconButton.done(onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
    Widget flatButtonContainer = Container(
      margin: EdgeInsets.all(20 * vHeight),
      child: Column(
        children: <Widget>[
          HYText(title: 'FlatButton'),
          Container(
            padding: EdgeInsets.only(top: 15 * vHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                HYFlatButton(title: 'Test', onPressed: () {}),
                HYFlatButton(title: 'Test', onPressed: () {}),
                HYFlatButton(title: 'Test', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
    Widget raisedButtonContainer = Container(
      margin: EdgeInsets.all(20 * vHeight),
      child: Column(
        children: <Widget>[
          HYText(title: 'RaisedButton'),
          Container(
            padding: EdgeInsets.only(top: 20 * vHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                HYRaisedButton(title: 'Test', onPressed: () {}),
                HYRaisedButton(title: 'Test', onPressed: () {}),
                HYRaisedButton(title: 'Test', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
    Widget outlineButtonContainer = Container(
      margin: EdgeInsets.all(20 * vHeight),
      child: Column(
        children: <Widget>[
          HYText(title: 'OutlineButton'),
          Container(
            padding: EdgeInsets.only(top: 20 * vHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                HYOutlineButton(title: 'Test', onPressed: () {}),
                HYOutlineButton(title: 'Test', onPressed: () {}),
                HYOutlineButton(title: 'Test', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );

    Widget buttonWithIconContainer = Container(
      margin: EdgeInsets.all(20 * vHeight),
      child: Column(
        children: <Widget>[
          HYText(title: 'Button With Icon'),
          Container(
            padding: EdgeInsets.only(top: 20 * vHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.send),
                  label: HYText(title: 'Send'),
                ),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.done),
                  label: HYText(title: 'Done'),
                ),
                OutlineButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: HYText(title: 'Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget customButtonContainer = Container(
      margin: EdgeInsets.all(20 * vHeight),
      child: Column(
        children: <Widget>[
          HYText(title: 'Custom Button'),
          Container(
            padding: EdgeInsets.only(top: 20 * vHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  child: HYText(title: 'Send', textColor: Colors.white),
                  color: Colors.lightGreen,
                  highlightColor: Colors.lightGreen[700],
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20 * vWidth)),
                  onPressed: () {},
                ),
                RaisedButton(
                  child: HYText(title: 'Done', textColor: Colors.white),
                  color: Colors.lightGreen,
                  highlightColor: Colors.lightGreen[700],
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20 * vWidth)),
                  onPressed: () {},
                ),
                OutlineButton(
                  child: HYText(title: 'Add'),
                  color: Colors.lightGreen,
                  highlightColor: Colors.lightGreen[700],
                  splashColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20 * vWidth)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
        appBar: HYAppBar(
          title: 'Button',
          actions: <Widget>[
            HYIconButton.web(onPressed: () => pushToWebView(context, section.url))
          ],
        ),
        body: ListView(
          children: <Widget>[
            iconButtonContainer,
            flatButtonContainer,
            raisedButtonContainer,
            outlineButtonContainer,
            buttonWithIconContainer,
            customButtonContainer
          ],
        ));
  }
}
