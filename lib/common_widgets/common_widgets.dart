import 'package:flutter/material.dart';

PreferredSizeWidget commonAppbar(String name) {
  return AppBar(
    title: Text(
      name,
      style: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w300,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.deepPurpleAccent,
  );
}
