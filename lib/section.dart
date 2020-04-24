import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';
import 'package:flutterapp/models/index.dart';

class SectionListPage extends StatelessWidget {
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
        final List<String> pages = [
          '1.1',
          '1.2',
          '1.3',
          '1.4',
          '2.3',
          '2.4',
          '2.5',
          '2.6',
          '3.1',
          '3.2',
          '4.1',
        ];

        if (pages.indexOf(section.page) >= 0) {
          pushToWebView(context, section.url);
        } else if (section.page == '2.1') {
          Navigator.pushNamed(
            context,
            '/fristAppPage',
            arguments: {'section': section},
          );
        } else if (section.page == '2.2') {
          final List<String> sectionNames = [
            '路由',
            '路由传值',
          ];

          final List<Section> sections = sectionNames.map((item) {
            return Section.init(item, section.url, section.page);
          }).toList();
          Navigator.pushNamed(context, '/routeControlListPage',
              arguments: {'title': title, 'sections': sections});
        } else if (section.page == '3.3') {
          Navigator.pushNamed(context, '/textPage',
              arguments: {'section': section});
        } else if (section.page == '3.4') {
          Navigator.pushNamed(context, '/buttonPage',
              arguments: {'section': section});
        } else if (section.page == '3.5') {
          Navigator.pushNamed(context, '/imagePage',
              arguments: {'section': section});
        } else if (section.page == '3.6') {
          Navigator.pushNamed(context, '/checkPage',
              arguments: {'section': section});
        } else if (section.page == '3.7') {
          final List<String> sectionNames = [
            'TextField',
            'FormField',
          ];

          final List<Section> sections = sectionNames.map((item) {
            return Section.init(item, section.url, section.page);
          }).toList();
          Navigator.pushNamed(context, '/commonSectionListPage', arguments: {
            'title': title,
            'sections': sections,
            'routes': ['/textfieldPage', '/textformfieldPage']
          });
        } else if (section.page == '3.8') {
          Navigator.pushNamed(context, '/progressPage',
              arguments: {'section': section});
        } else if (section.page == '4.2') {
          final List<String> sectionNames = [
            'Row',
            'Column',
          ];

          final List<Section> sections = sectionNames
              .map((item) => Section.init(item, section.url, section.page))
              .toList();

          Navigator.pushNamed(context, '/commonSectionListPage', arguments: {
            'title': title,
            'sections': sections,
            'routes': ['/rowPage', '/columnPage']
          });
        } else if (section.page == '4.3') {
          Navigator.pushNamed(context, '/flexPage',
              arguments: {'section': section});
        } else if (section.page == '4.4') {
          final List<String> sectionNames = [
            'Wrap',
            'Flow',
          ];

          final List<Section> sections = sectionNames
              .map((item) => Section.init(item, section.url, section.page))
              .toList();
          Navigator.pushNamed(context, '/commonSectionListPage', arguments: {
            'title': title,
            'sections': sections,
            'routes': ['/wrapPage', '/flowPage']
          });
        } else if (section.page == '4.5') {
          Navigator.pushNamed(context, '/stackPage',
              arguments: {'section': section});
        } else if (section.page == '4.6') {
          Navigator.pushNamed(context, '/alignPage',
              arguments: {'section': section});
        } else if (section.page == '5.4') {
          final List<String> sectionNames = [
            'Transform',
            'Matrix4',
          ];
          final List<Section> sections = sectionNames
              .map((item) => Section.init(item, section.url, section.page))
              .toList();
          Navigator.pushNamed(context, '/commonSectionListPage', arguments: {
            'title': title,
            'sections': sections,
            'routes': ['/transformListPage', '/flowPage']
          });
        }
      },
    );
  }
}
