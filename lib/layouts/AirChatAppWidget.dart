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

  bool _searchBoxVisitable;

  final GlobalKey<ScaffoldState> _rootScaffoldKey = GlobalKey<ScaffoldState>();

  void _openUserDraw() {
    final state = this._rootScaffoldKey.currentState;
    if (state != null) {
      state.openDrawer();
    }
  }

  void _openBottomSheet() {
    final state = this._rootScaffoldKey.currentState;
    if (state == null) {
      return;
    }

    state.showBottomSheet((context) {
      return Container(
          height: 400,
          color: Colors.amber,
          child: Center(
              child: ElevatedButton(
                  child: Text('close'),
                  onPressed: () {
                    Navigator.pop(context);
                  })));
    });
  }

  @override
  void initState() {
    super.initState();
    _searchBoxVisitable = false;
  }

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
        _searchBoxVisitable = false;
      });
    }

    return Scaffold(
      key: _rootScaffoldKey,
      appBar: AppBar(
        leading: Center(
            child: GestureDetector(
                onTap: _openUserDraw,
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundImage: NetworkImage(
                      "https://book.flutterchina.club/assets/img/2-3.c20b3236.png"),
                ))),
        actions: [
          IconButton(
            icon: Icon(CustomIcons.SEARCH_ICON),
            onPressed: () {
              setState(() {
                _searchBoxVisitable = !this._searchBoxVisitable;
              });
            },
          ),
          Padding(padding: EdgeInsets.only(right: 8.0)),
          PopupMenuButton(
              icon: Icon(CustomIcons.PLUS_ICON),
              offset: Offset(0, 54.0),
              itemBuilder: (BuildContext ctx) =>
                  [PopupMenuItem(child: Text('hello'))])
        ],
        backgroundColor: ThemeColors.TOOLBAR_COLOR,
        bottom: SearchBox(visitable: _searchBoxVisitable),
      ),
      drawer: new Drawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _renderPages(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeColors.ACTION_BUTTON_COLOR,
        onPressed: _openBottomSheet,
        child: Icon(CustomIcons.VIDEO_ICON),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _renderNavigationItems(),
        onTap: _navigateTo,
        selectedItemColor: ThemeColors.NAVITEM_SELECTED_COLOR,
        unselectedItemColor: ThemeColors.NAVITEM_UNSELECTED_COLOR,
        backgroundColor: ThemeColors.TOOLBAR_COLOR,
      ),
      // bottomSheet: BottomSheet(builder: (context) {
      //   return Container(height: 20, child: Text('hello'));
      // }, onClosing: () {
      //   print(1);
      // })
    );
  }
}
