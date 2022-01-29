import 'package:AirChat/widgets/SearchBox.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    double titleBarHeight = mediaSize.height * 0.2;
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
                  "https://i1.hdslb.com/bfs/face/0d9d456607b880d2767513dcf65f43c9d82dadea.jpg@120w_120h_1c_1s.webp"),
            ),
          )),
          actions: [
            PopupMenuButton(
                icon: Icon(CustomIcons.PLUS_ICON),
                // captureInheritedThemes: false,
                offset: Offset(0, 54.0),
                itemBuilder: (BuildContext ctx) =>
                    [PopupMenuItem(child: Text('hello'))])
          ],
          backgroundColor: ThemeColors.TOOLBAR_COLOR,
          toolbarHeight: titleBarHeight,
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
