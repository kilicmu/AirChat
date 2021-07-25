import 'package:AirChat/widgets/SearchBox.dart';
import 'package:flutter/material.dart';
import 'package:AirChat/widgets/PressableIcon.dart';
import 'package:AirChat/assets/consts.dart';

class PageDescribeData {
  const PageDescribeData({
    this.label,
    this.icon,
    this.page,
  })  : assert(label != null),
        assert(icon != null),
        assert(page != null);

  final String label;
  final Icon icon;
  final Widget page;
}

class AirChatAppWidget extends StatefulWidget {
  const AirChatAppWidget({Key key, this.pageDescribes}) : super(key: key);

  final List<PageDescribeData> pageDescribes;

  @override
  _AirChatAppWidgetState createState() => _AirChatAppWidgetState();
}

class _AirChatAppWidgetState extends State<AirChatAppWidget> {
  final PageController _pageController = new PageController();

  int _currentIndex = 0;
  List<Widget> _renderPages() =>
      widget.pageDescribes.map((e) => e.page).toList();
  List<BottomNavigationBarItem> _renderNavigationItems() => widget.pageDescribes
      .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
      .toList();

  void _pressSearchIcon() {}

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    void _navigateTo(idx) {
      setState(() {
        _currentIndex = idx;
      });
      final jumpOffset = mediaSize.width * idx;
      _pageController.jumpTo(jumpOffset);
    }

    void _onPageChanged(idx) {
      setState(() {
        _currentIndex = idx;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Container(
              child: GestureDetector(
            onTap: () {
              print('pressed avator');
            },
            child: CircleAvatar(
              radius: 18.0,
              backgroundImage: NetworkImage(
                  "https://book.flutterchina.club/assets/img/2-3.c20b3236.png"),
            ),
          )),
          actions: [
            PressableIcon(
                icon: Icon(CustomIcons.SEARCH_ICON), onPress: _pressSearchIcon),
            Padding(padding: EdgeInsets.only(right: 18.0)),
            PopupMenuButton(
                icon: Icon(CustomIcons.PLUS_ICON),
                captureInheritedThemes: false,
                offset: Offset(0, 54.0),
                itemBuilder: (BuildContext ctx) =>
                    [PopupMenuItem(child: Text('hello'))])
          ],
          backgroundColor: ThemeColors.TOOLBAR_COLOR,
          toolbarHeight: 108.0,
          bottom: SearchBox(),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: _renderPages(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: _renderNavigationItems(),
          onTap: _navigateTo,
          selectedItemColor: ThemeColors.NAVITEM_SELECTED_COLOR,
          unselectedItemColor: ThemeColors.NAVITEM_UNSELECTED_COLOR,
          backgroundColor: ThemeColors.TOOLBAR_COLOR,
        ));
  }
}
