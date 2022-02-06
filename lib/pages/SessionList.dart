import 'package:flutter/material.dart';
import 'package:AirChat/widgets/SessionSummary.dart';

class SessionList extends StatefulWidget {
  const SessionList({Key key}) : super(key: key);

  @override
  _SessionListState createState() => _SessionListState();
}

class _SessionListState extends State<SessionList> {
  var sessionList = [];

  initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1)).then((value) {
      setState(() {
        sessionList = [
          SessionSummary(
              session: Session(
                  sessionID: '1000001',
                  sessionLabel: 'lucy',
                  recentlyMessage: 'hello121',
                  // sessionHeadPicture: null,
                  finalTime: DateTime.now().millisecond)),
          SessionSummary(
              session: Session(
                  sessionID: '1000002',
                  sessionLabel: 'kafuka',
                  recentlyMessage: 'hellolily',
                  // sessionHeadPicture: null,
                  finalTime: DateTime.now().millisecond)),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _renderSessionList() {
      return sessionList.fold<List<Widget>>(
          [],
          (previousValue, element) =>
              [...previousValue, element, SessionDivider()]);
    }

    return Container(
      child: sessionList.length == 0
          ? Icon(Icons.local_dining)
          : ListView(
              children: _renderSessionList(),
            ),
    );
  }
}
