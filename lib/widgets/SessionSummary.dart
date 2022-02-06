import 'dart:ui';

import 'package:flutter/material.dart';

enum SessionType {
  DIALOGUE,
  GROUP,
}

class Session {
  const Session(
      {this.sessionID,
      this.sessionLabel,
      this.sessionType = SessionType.DIALOGUE,
      this.recentlyMessage,
      this.sessionHeadPicturePath,
      this.finalTime});

  final String sessionID; // 此session唯一id
  final SessionType sessionType;
  final String sessionLabel; // session的标签
  final String recentlyMessage; // 最近一条消息
  final String sessionHeadPicturePath; // session的头像
  final int finalTime;
}

enum MessageTypes {
  PICTURE,
  TEXT, //
  REPLY, // 回复
}

class User {
  const User(this.userID, this.username, this.holdSessions);
  final int userID;
  final String username;
  final List<Session> holdSessions;
}

class Message {
  const Message(this.messageID, this.messageHash, this.fromUser, this.toSession,
      this.replyUser, this.content);
  final int messageID;
  final String messageHash;
  final User fromUser;
  final Session toSession;
  final User replyUser;
  final String content;
}

class SessionSummary extends StatefulWidget {
  const SessionSummary({Key key, this.session}) : super(key: key);

  final Session session;

  @override
  _SessionSummaryState createState() => _SessionSummaryState();
}

String timeTransformer(int timestemp) {
  final duringTimestemp = DateTime.now().millisecond - timestemp;
  final oneDayTimestemp = DateTime(0, 0, 1).millisecond;
  final dayCount = duringTimestemp / duringTimestemp;
  if (dayCount > 0) {
    return "${dayCount.floor().toString()} days ago";
  }
  return "${duringTimestemp / 1000 / 60} minutes ago";
}

class _SessionSummaryState extends State<SessionSummary> {
  final headerRadio = 24.0;
  @override
  Widget build(BuildContext context) {
    final session = widget.session;
    final label = session.sessionLabel;
    final recentlyMessage = session.recentlyMessage ?? '';
    final finalTime = timeTransformer(session.finalTime) ?? '';
    
    return GestureDetector(
        onTap: () => Navigator.of(context).pushNamed("chat", arguments: session),
        child: SingleChildScrollView(
            child: Container(
                height: 68,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Center(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(headerRadio)),
                          height: headerRadio * 2,
                          width: headerRadio * 2,
                        ))),
                    Expanded(
                        flex: 6,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 2.4)),
                                Container(
                                  child: Text(label,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600)),
                                ),
                                Padding(padding: EdgeInsets.only(top: 7.2)),
                                Text(recentlyMessage,
                                    overflow: TextOverflow.ellipsis)
                              ],
                            ))),
                    Expanded(
                        flex: 2,
                        child: Container(
                            child: Text(finalTime,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.0)))),
                  ],
                ))));
  }
}


class SessionDivider extends StatelessWidget {
  const SessionDivider({ Key key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
  const DIVIDER_HEIGHT = 1.0;
    return Divider(
      height: DIVIDER_HEIGHT,
      color: Colors.grey
    );
  }
}