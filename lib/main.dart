import 'package:AirChat/layouts/AirChatAppWidget.dart';
import 'package:AirChat/assets/consts.dart';
import 'package:AirChat/pages/ChatPage.dart';
import 'package:AirChat/views/SessionsView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AirChatApp());
}

class AirChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      'chat': (context) => ChatPage(),
      '/': (context) => AirChatHome(),
    });
  }
}

class AirChatHome extends StatefulWidget {
  AirChatHome({Key key}) : super(key: key);

  @override
  _AirChatHomeState createState() => _AirChatHomeState();
}

class _AirChatHomeState extends State<AirChatHome> {
  final List<PageDescribeData> _pageDescribes = [
    PageDescribeData(
        label: 'session',
        icon: Icon(CustomIcons.PEOPLES_ICON),
        page: SessionsView()),
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
