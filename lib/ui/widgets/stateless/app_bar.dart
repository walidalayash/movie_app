import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;

  MyAppBar([this.title]);

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      title = '';
    }
    return AppBar(
      title: Container(
        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Text(title!),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight((58));
}
