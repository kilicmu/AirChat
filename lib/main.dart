import 'package:AirChat/layouts/AirChatAppWidget.dart';
import 'package:AirChat/assets/consts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<PageDescribeData> _pageDescribes = [
    PageDescribeData(
        label: 'session',
        icon: Icon(CustomIcons.PEOPLES_ICON),
        page: Container(child: Text('page1'))),
    PageDescribeData(
        label: 'applications',
        icon: Icon(CustomIcons.APPS_ICON),
        page: Container(child: Text('page2'))),
  ];

  List<PopupMenuEntry<dynamic>> addNewFriendsMenuItemActionRecord = [
    const PopupMenuItem<int>(child: Text('do1')),
    const PopupMenuItem<int>(child: Text('do2'))
  ];

  @override
  Widget build(BuildContext context) {
    return AirChatAppWidget(pageDescribes: _pageDescribes);
  }
}
