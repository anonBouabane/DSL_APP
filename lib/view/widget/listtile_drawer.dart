// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListTileDrawer extends StatelessWidget {
  String textTile;
  dynamic style;
  dynamic icon;
  dynamic onTap;
  ListTileDrawer(
      {Key? key,
      required this.textTile,
      required this.style,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
        size: 30,
      ),
      title: Text(
        textTile,
        style: style,
      ),
      onTap: onTap,
    );
  }
}
