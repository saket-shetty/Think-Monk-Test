import 'package:flutter/material.dart';
import 'package:teach_us/screens/post_listing/post_listing_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Think Monk",
      home: PostListingScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
