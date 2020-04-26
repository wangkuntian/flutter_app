import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/common/main.dart';

class TabBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TabBarPageState();
}

class TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> items = ['News', 'Image', 'Video'];
  List<Widget> icons = [HYIcon.news, HYIcon.image, HYIcon.video];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HYText(title: 'Hello World'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: items
              .asMap()
              .keys
              .map((index) => Tab(text: items[index], icon: icons[index]))
              .toList(),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: items
              .map((item) => Center(child: HYText.bigAndBold(title: item)))
              .toList()),
    );
  }
}

class ContentView extends StatelessWidget {
  final String title;

  const ContentView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HYText.bigAndBold(title: title),
    );
  }
}

class BottomAppBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BottomAppBarPageState();
}

class BottomAppBarPageState extends State<BottomAppBarPage> {
  int selectedIndex = 0;
  List<Widget> items;

  @override
  void initState() {
    super.initState();
    items = ['Home', 'Add', 'Setting']
        .map((item) => ContentView(title: item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HYAppBar(title: 'BottomAppBar'),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => selectedIndex = 1),
        child: HYIcon.add,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            HYIconButton.home(
                onPressed: () => setState(() => selectedIndex = 0)),
            SizedBox(),
            HYIconButton.setting(
                onPressed: () => setState(() => selectedIndex = 2)),
          ],
        ),
      ),
      body: items[selectedIndex],
    );
  }
}

class PageViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageViewPageState();
}

class PageViewPageState extends State<PageViewPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  List<String> items = ['News', 'Image', 'Video'];
  List<Widget> icons = [HYIcon.news, HYIcon.image, HYIcon.video];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HYText(title: 'Hello World'),
        centerTitle: true,
      ),
      body: PageView(
          controller: _pageController,
          children: items
              .map((item) => Center(child: HYText.bigAndBold(title: item)))
              .toList()),
    );
  }
}
