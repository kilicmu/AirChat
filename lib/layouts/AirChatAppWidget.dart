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

  int _currentPageIdx = 0;

  List<BottomNavigationBarItem> _renderNavigationItems() => widget.pageDescribes
      .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
      .toList();

  bool _searchBoxVisitable;
  bool bottomSheetVisible = false;

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
    setState(() {
      bottomSheetVisible = true;
    });
    state.showBottomSheet((context) {
      return Container(
          height: 400,
          color: Colors.amber,
          child: Center(
              child: ElevatedButton(
                  child: Text('close'),
                  onPressed: _closeBottomSheet(context))));
    });
  }

  _closeBottomSheet(ctx) {
    return () {
      if (!bottomSheetVisible) {
        return;
      }
      Navigator.pop(ctx);
      setState(() {
        bottomSheetVisible = false;
      });
    };
  }

  Widget _renderPage() {
    return widget.pageDescribes[_currentPageIdx].page;
  }

  void _navigateTo(idx) {
    setState(() {
      _currentPageIdx = idx;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchBoxVisitable = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _rootScaffoldKey,
      appBar: AppBar(
        leading: Center(
            child: GestureDetector(
                onTap: _openUserDraw,
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundImage: NetworkImage(
                      "https://i0.hdslb.com/bfs/face/488371ac23b8dc66ff8615c2f5071e8761b04368.jpg@240w_240h_1c_1s.webp"),
                ))),
        actions: [
          IconButton(
            icon: Icon(CustomIcons.SEARCH_ICON),
            onPressed: () {
              setState(() {
                _searchBoxVisitable = !this._searchBoxVisitable;
              });

              // 回收键盘
              FocusScope.of(context).requestFocus(FocusNode());
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
      body: Center(
        child: _renderPage(),
      ),
      floatingActionButton: Visibility(
          child: FloatingActionButton(
            backgroundColor: ThemeColors.ACTION_BUTTON_COLOR,
            onPressed: _openBottomSheet,
            child: Icon(CustomIcons.VIDEO_ICON),
          ),
          visible: !bottomSheetVisible),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIdx,
        items: _renderNavigationItems(),
        onTap: _navigateTo,
        selectedItemColor: ThemeColors.NAVITEM_SELECTED_COLOR,
        unselectedItemColor: ThemeColors.NAVITEM_UNSELECTED_COLOR,
        backgroundColor: ThemeColors.TOOLBAR_COLOR,
      ),
    );
  }
}
