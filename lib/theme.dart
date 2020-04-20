import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/provider.dart';
import 'package:provider/provider.dart';

import 'common/main.dart';

final Map materialColor = {
  'lightGreen': Colors.lightGreen,
  'red': Colors.red,
  'blue': Colors.blue,
  'lime': Colors.lime,
  'orange': Colors.orange,
};

class AppTheme {
  static Color mainColor = materialColor['lightGreen'];

  static ThemeData getThemeData(String theme) {
    mainColor = materialColor[theme];
    ThemeData themData = ThemeData(
      //深色还是浅色
      brightness: Brightness.light,

      // 页面的背景颜色
      scaffoldBackgroundColor: Colors.white,

      // 主颜色
      primaryColor: mainColor,

      // 按钮
      buttonTheme: ButtonThemeData(
//        shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(5.0),
//        ),
        textTheme: ButtonTextTheme.primary,
        buttonColor: mainColor,
      ),

      // 小部件的前景色（旋钮，文本，过度滚动边缘效果等）。
      accentColor: mainColor,

      // appbar
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),

      // 图标样式
      iconTheme: IconThemeData(
        color: mainColor,
      ),

      // 用于自定义对话框形状的主题。
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.black87,
        ),
      ),
    );
    return themData;
  }
}

final List materialColors = [
  Colors.lightGreen,
  Colors.red,
  Colors.blue,
  Colors.lime,
  Colors.orange
];
final List themes = ['lightGreen', 'red', 'blue', 'lime', 'orange'];

class SettingListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> titles = ['Theme', 'Language'];
    List icons = [HYIcon.theme, HYIcon.language];
    return Scaffold(
      appBar: HYAppBar(title: 'Setting'),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: icons[index],
              title: HYText(
                title: titles[index],
              ),
              onTap: () {
                if (index == 0) {
                  Navigator.pushNamed(context, '/themePage');
                }
              },
            );
          },
          itemCount: titles.length),
    );
  }
}

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int themeIndex = 0;
    return Consumer<ThemeModel>(
      builder: (context, theme, _) {
        themeIndex = themes.indexOf(theme.getTheme());
        return Scaffold(
          appBar: HYAppBar(title: 'Theme'),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Container(
                  height: 40 * vHeight,
                  margin: EdgeInsets.only(
                      left: 20 * vWidth,
                      top: 6 * vHeight,
                      right: 20 * vWidth,
                      bottom: 6 * vHeight),
                  color: materialColors[index],
                  child: index == themeIndex
                      ? Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 5 * vWidth),
                          child: HYIcon.check,
                        )
                      : null,
                ),
                onTap: () {
                  Provider.of<ThemeModel>(context, listen: false)
                      .setTheme(themes[index]);
                },
              );
            },
            itemCount: materialColors.length,
          ),
        );
      },
    );
  }
}
