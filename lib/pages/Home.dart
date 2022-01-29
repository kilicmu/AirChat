import 'package:AirChat/assets/consts.dart';
import 'package:AirChat/layouts/AirChatAppWidget.dart';
import 'package:AirChat/pages/SessionList.dart';
import "package:flutter/material.dart";

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _AirChatHomeState createState() => _AirChatHomeState();
}

class _AirChatHomeState extends State<Home> {
  final List<PageDescribeData> _pageDescribes = [
    PageDescribeData(
        label: 'session',
        icon: Icon(CustomIcons.PEOPLES_ICON),
        page: SessionList()),
    PageDescribeData(
        label: 'applications',
        icon: Icon(CustomIcons.APPS_ICON),
        page: Container(child: Text('route2'))),
  ];

  List<PopupMenuEntry<dynamic>> addNewFriendsMenuItemActionRecords = [
    const PopupMenuItem<int>(child: Text('do1')),
    const PopupMenuItem<int>(child: Text('do2'))
  ];

  @override
  Widget build(BuildContext context) {
    return AirChatAppWidget(pageDescribes: _pageDescribes);
  }
}
