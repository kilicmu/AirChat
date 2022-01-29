import 'package:AirChat/pages/ChatPage.dart';
import 'package:AirChat/pages/Friends.dart';
import 'package:AirChat/pages/Home.dart';

final routes = {
  'friends': (context) => FriendsPage(title: "friend1"),
  'chat': (context) => ChatPage(),
  '/': (context) => Home(),
};
