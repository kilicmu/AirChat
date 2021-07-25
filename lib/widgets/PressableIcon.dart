import 'package:flutter/material.dart';

class PressableIcon extends StatelessWidget {
  final void Function() onPress;
  final Icon icon;

  const PressableIcon({this.onPress, this.icon}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress, child: icon);
  }
}
