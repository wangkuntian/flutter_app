import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  ImageProvider headImage = AssetImage('assets/images/fox.png');

  Future<int> _showModalBottomSheet() {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: HYIcon.camera,
              title: HYText(title: '拍一张'),
              onTap: () => Navigator.of(context).pop(0),
            ),
            ListTile(
              leading: HYIcon.gallery,
              title: HYText(title: '相册'),
              onTap: () => Navigator.of(context).pop(1),
            )
          ],
        );
      },
    );
  }

  Future getImageByCamera() async {
    if (await Permission.camera.request().isGranted) {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() => headImage = FileImage(image));
    }
  }

  Future getImageByGallery() async {
    if (await Permission.photos.request().isGranted) {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() => headImage = FileImage(image));
    }
  }

  get _drawerHeader => Container(
        height: 160 * vHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/sky.png'))),
        margin: EdgeInsets.only(bottom: 10 * vWidth),
        child: Padding(
          padding: EdgeInsets.only(left: 20 * vWidth, top: 60 * vHeight),
          child: Wrap(
            spacing: 10 * vWidth,
            children: <Widget>[
              Container(
                width: 66 * vWidth,
                height: 66 * vWidth,
                child: GestureDetector(
                  onTap: () {
                    _showModalBottomSheet().then((int index) {
                      print(index);
                      if (index == 0) {
                        getImageByCamera();
                      } else if (index == 1) {
                        getImageByGallery();
                      }
                    });
                  },
                  child: CircleAvatar(backgroundImage: headImage),
                ),
              ),
              Wrap(
                direction: Axis.vertical,
                spacing: 10 * vHeight,
                children: <Widget>[
                  HYText(
                    title: 'HuYue',
                    textColor: Colors.white,
                  ),
                  HYText(
                    title: '个性签名',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: <Widget>[
            _drawerHeader,
            ListTile(
              title: HYText(title: 'Settings'),
              leading: HYIcon.setting,
              trailing: HYIcon.arrowRight,
              onTap: () => Navigator.pushNamed(context, '/settingListPage'),
            ),
            ListTile(
              title: HYText(title: 'Test'),
              leading: HYIcon.warning,
              onTap: () => Navigator.pushNamed(context, '/shopPage'),
            )
          ],
        ),
      ),
    );
  }
}
