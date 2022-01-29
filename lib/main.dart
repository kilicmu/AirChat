import 'package:AirChat/routers/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AirChatApp());
}

class AirChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: routes);
  }
}
