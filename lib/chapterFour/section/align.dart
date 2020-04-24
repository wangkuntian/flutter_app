import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class AlignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlignPageState();
}

class AlignPageState extends State<AlignPage> {
  Section section;
  List<Alignment> _alignments = [
    Alignment.center,
    Alignment.topCenter,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.centerRight,
  ];

  Alignment _alignment = Alignment.center;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context).settings.arguments;
    section = arguments['section'];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: HYAppBar(
          title: 'Align',
          actions: <Widget>[
            HYIconButton.web(
                onPressed: () => pushToWebView(context, section.url))
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  width: 160 * vWidth,
                  height: 160 * vWidth,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: _alignment,
                    child: HYIcon.star,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20 * vWidth),
                    child: HYText.bigAndBold(title: 'Align'),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 30 * vHeight, left: 20 * vWidth),
                    child: Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        HYText(title: 'alignment'),
                        HYDropdownButton(
                          value: _alignment,
                          items: _alignments,
                          onChanged: (value) =>
                              setState(() => _alignment = value),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
}
