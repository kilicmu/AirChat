import 'package:AirChat/assets/consts.dart';
import 'package:AirChat/widgets/PressableIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBox extends StatefulWidget implements PreferredSizeWidget {
  const SearchBox({Key key, @required this.visitable, this.height = 54.0})
      : super(key: key);

  final double height;
  final bool visitable;

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
  var textEditingController = null;

  @override
  void initState() {
    super.initState();
    textEditingController = new TextEditingController(text: '');
  }

  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _cleanInputedSearchText() {
      print(textEditingController);
      if (textEditingController == null) {
        return;
      }
      textEditingController.text = '';
    }

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
                child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      TextField(
                        style: TextStyle(
                            fontSize: 16.0, height: 1.0, color: Colors.black),
                        cursorColor: Colors.grey[400],
                        controller: textEditingController,
                        decoration: InputDecoration(
                          hintText: 'search',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                      Positioned(
                          right: 1,
                          child: PressableIcon(
                            icon: Icon(Icons.close_sharp),
                            onPress: _cleanInputedSearchText,
                          ))
                    ]))));
  }
}
