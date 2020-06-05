import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class SectionListPage extends StatelessWidget {
  void commonRoute(BuildContext context, Section section,
      List<String> sectionNames, String to, Map arguments) {
    final List<Section> sections = sectionNames.map((item) {
      return Section.init(item, section.url, section.page);
    }).toList();
    arguments['sections'] = sections;
    Navigator.pushNamed(context, to, arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments;
    final List<Section> sections = arguments['sections'];
    final String title = arguments['title'];
    return HYSectionListView(
      title: title,
      sections: sections,
      onTap: (int index) {
        final Section section = sections[index];
        final String title = section.section.split('：')[1];
        final Map<String, Object> routePages = {
          '1.1': '',
          '1.2': '',
          '1.3': '',
          '1.4': '',
          '2.1': '/firstAppPage',
          '2.2': {
            'items': ['路由', '路由传值'],
            'routes': ['', ''],
            'title': title
          },
          '2.3': '',
          '2.4': '',
          '2.5': '',
          '2.6': '',
          '3.1': '',
          '3.2': '',
          '3.3': '/textPage',
          '3.4': '/buttonPage',
          '3.5': '/imagePage',
          '3.6': '/checkPage',
          '3.7': {
            'items': ['TextField', 'FormField'],
            'routes': ['/textFieldPage', '/textFormFieldPage'],
            'title': title
          },
          '3.8': '/progressPage',
          '4.1': '',
          '4.2': {
            'items': ['Row', 'Column'],
            'routes': ['/rowPage', '/columnPage'],
            'title': title
          },
          '4.3': '',
          '4.4': {
            'items': ['Wrap', 'Flow'],
            'title': title,
            'routes': ['/wrapPage', '/flowPage']
          },
          '4.5': '/stackPage',
          '4.6': '/alignPage',
          '5.1': '',
          '5.2': '',
          '5.4': {
            'items': ['Transform', 'Matrix4'],
            'title': title,
            'routes': ['/transformListPage', '/matrixListPage']
          },
          '5.6': {
            'items': ['Scaffold', 'TabBar', 'BottomAppBar'],
            'title': title,
            'routes': ['', '/tabBarPage', '/bottomAppBarPage']
          },
          '9.2': {
            'items': ['Basic', 'Curve', 'AnimatedWidget', 'AnimatedBuilder'],
            'title': title,
            'routes': [
              '/animationPage',
              '/curveAnimationPage',
              '/animatedWidgetPage',
              '/animatedBuilderPage'
            ]
          },
          '9.3': '/routeAnimatedPage',
          '9.4': '/heroAnimationPage',
          '9.5': '/StaggerAnimationPage',
          '9.6': '/SwitcherAnimationPage',
          '9.7': {
            'items': [
              '自定义',
              'AnimatedPadding',
              'AnimatedPositioned',
              'AnimatedOpacity',
              'AnimatedAlign',
              'AnimatedContainer',
              'AnimatedDefaultTextStyle'
            ],
            'title': title,
            'routes': [
              '/AnimationPage',
              '/AnimatedPaddingPage',
              '/AnimatedPositionedPage',
              '/AnimatedOpacityPage',
              '/AnimatedAlignPage',
              '/AnimatedContainerPage',
              '/AnimatedDefaultTextStylePage'
            ]
          }
        };
        if (routePages.containsKey(section.page)) {
          if (routePages[section.page].runtimeType == String) {
            if (routePages[section.page] != '') {
              Navigator.pushNamed(context, routePages[section.page],
                  arguments: {'section': section});
            } else {
              pushToWebView(context, section.url);
            }
          } else {
            Map item = routePages[section.page];
            if (section.page == '2.2') {
              commonRoute(
                  context,
                  section,
                  item['items'],
                  '/routeControlListPage',
                  {'title': item['title'], 'routes': item['routes']});
            } else {
              commonRoute(
                  context,
                  section,
                  item['items'],
                  '/commonSectionListPage',
                  {'title': item['title'], 'routes': item['routes']});
            }
          }
        }
      },
    );
  }
}
