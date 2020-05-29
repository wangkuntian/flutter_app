import 'package:flutter/material.dart';
import 'package:flutterapp/chapterFive/index.dart';
import 'package:flutterapp/chapterFour/index.dart';
import 'package:flutterapp/chapterNine/index.dart';
import 'package:flutterapp/chapterThree/index.dart';
import 'package:flutterapp/chapterTwo/index.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/test/shop.dart';
import '../section.dart';
import '../theme.dart';
import 'markdown.dart';

final Map<String, WidgetBuilder> routes = {
  '/sectionListPage': (context) => SectionListPage(),
  '/fristAppPage': (context) => FirstAppPage(title: '计数器示例'),
  '/commonSectionListPage': (context) => CommonSectionListPage(),
  '/routeControlListPage': (context) => RouteControlListPage(),
  '/newRoutePage': (context) => NewRoutePage(),
  '/routePage': (context) => RoutePage(),
  '/routePassValuePage': (context) => RoutePassValuePage(),
  '/routeValuePage': (context) => RouteValuePage(),
  '/textPage': (context) => TextPage(),
  '/buttonPage': (context) => ButtonPage(),
  '/imagePage': (context) => ImagePage(),
  '/checkPage': (context) => CheckPage(),
  '/textfieldPage': (context) => TextFieldPage(),
  '/textformfieldPage': (context) => TextFormFieldPage(),
  '/progressPage': (context) => ProgressPage(),
  '/rowPage': (context) => RowPage(),
  '/columnPage': (context) => ColumnPage(),
  '/flexPage': (context) => FlexPage(),
  '/wrapPage': (context) => WrapPage(),
  '/flowPage': (context) => FlowPage(),
  '/stackPage': (context) => StackPage(),
  '/alignPage': (context) => AlignPage(),
  '/transformListPage': (context) => TransformListPage(),
  '/translatePage': (context) => TranslatePage(),
  '/rotatePage': (context) => RotatePage(),
  '/scalePage': (context) => ScalePage(),
  '/matrixListPage': (context) => MatrixListPage(),
  '/rotationPage': (context) => RotationPage(),
  '/skewPage': (context) => SkewPage(),
  '/tabBarPage': (context) => TabBarPage(),
  '/bottomAppBarPage': (context) => BottomAppBarPage(),
  '/animationPage': (context) => BasicAnimationPage(),
  '/curveAnimationPage': (context) => CurveAnimationPage(),
  '/animatedWidgetPage': (context) => AnimatedWidgetPage(),
  '/animatedBuilderPage': (context) => AnimatedBuilderPage(),
  '/routeAnimatedPage': (context) => RouteAnimatedPage(),
  '/heroAnimationPage': (context) => HeroAnimationPage(),
  '/heroAnimationDetailPage': (context) => HeroAnimationDetailPage(),
  '/pageViewPage': (context) => PageViewPage(),
  '/settingListPage': (context) => SettingListPage(),
  '/themePage': (context) => ThemePage(),
  '/shopPage': (context) => ShopPage(),
  '/markDownPage': (context) => MarkDownPage(title: '源代码'),
};
