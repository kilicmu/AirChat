import 'package:AirChat/assets/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBox extends StatefulWidget implements PreferredSizeWidget {
  const SearchBox(
      {Key key,
      @required this.visitable,
      this.height = 54.0,
      this.textEditingController})
      : super(key: key);

  final double height;
  final bool visitable;
  final TextEditingController textEditingController;

  @override
  _SearchBoxState createState() => _SearchBoxState();

  @override
  Size get preferredSize {
    if (visitable) {
      return Size.fromHeight(this.height);
    }
    return Size.fromHeight(0);
  }
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Offstage(
        offstage: !widget.visitable,
        child: Container(
            height: widget.height,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12.0),
                decoration: BoxDecoration(
                    color: ThemeColors.SEARCH_AREA_COLOR,
                    borderRadius: BorderRadius.circular(4.0)),
                child: TextField(
                  style: TextStyle(
                      fontSize: 16.0, height: 1.0, color: Colors.white),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      hintText: 'search',
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ))));
  }
}
