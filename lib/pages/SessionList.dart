import 'package:flutter/material.dart';
import 'package:AirChat/widgets/SessionSummary.dart';

class SessionList extends StatefulWidget {
  const SessionList({Key key}) : super(key: key);

  @override
  _SessionListState createState() => _SessionListState();
}

class _SessionListState extends State<SessionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SessionSummary(
              session: Session(
                  sessionID: '1000001',
                  sessionLabel: 'lucy',
                  recentlyMessage: 'hello1122333311112221111111workdfdfdf1',
                  // sessionHeadPicture: null,
                  finalTime: DateTime.now().millisecond))
        ],
      ),
    );
  }
}
