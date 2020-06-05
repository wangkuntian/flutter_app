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
  '/firstAppPage': (context) => FirstAppPage(title: '计数器示例'),
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
  '/textFieldPage': (context) => TextFieldPage(),
  '/textFormFieldPage': (context) => TextFormFieldPage(),
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
  '/StaggerAnimationPage': (context) => StaggerAnimationPage(),
  '/SwitcherAnimationPage': (context) => SwitcherAnimationPage(),
  '/AnimationPage': (context) => AnimationPage(),
  '/AnimatedPaddingPage': (context) => AnimatedPaddingPage(),
  '/AnimatedPositionedPage': (context) => AnimatedPositionedPage(),
  '/AnimatedOpacityPage': (context) => AnimatedOpacityPage(),
  '/AnimatedAlignPage': (context) => AnimatedAlignPage(),
  '/AnimatedContainerPage': (context) => AnimatedContainerPage(),
  '/pageViewPage': (context) => PageViewPage(),
  '/settingListPage': (context) => SettingListPage(),
  '/themePage': (context) => ThemePage(),
  '/shopPage': (context) => ShopPage(),
  '/markDownPage': (context) => MarkDownPage(title: '源代码'),
};
