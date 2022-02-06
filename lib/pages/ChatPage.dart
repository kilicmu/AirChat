import 'package:AirChat/widgets/SessionSummary.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final session = ModalRoute.of(context).settings.arguments as Session;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text(session.sessionLabel)),
        body: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(width: screenWidth, height: 10))
            ])));
  }
}
