import 'package:flutter/material.dart';
import 'package:AirChat/widgets/SessionSummary.dart';

class SessionRecord {
  const SessionRecord({this.id, this.label, this.recentMsg, this.header});

  final String id;
  final String label;
  final String recentMsg;
  final Image header;
}

class SessionsView extends StatefulWidget {
  const SessionsView({Key key, List<SessionRecord> sessionRecords})
      : super(key: key);

  @override
  _SessionsViewState createState() => _SessionsViewState();
}

class _SessionsViewState extends State<SessionsView> {
  @override
  Widget build(BuildContext context) {
    List<SessionSummary> _renderSessionSummarys() {}

    return ListView(
      children: _renderSessionSummarys(),
    );
  }
}
