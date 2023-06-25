import 'dart:convert';

import 'package:flutter/material.dart';


Color petroleum = const Color(0xFF324755);
Color white = Colors.white;
Color ko = const Color(0xff1a033b);
Color black = Colors.black;
Color orange = const Color(0xFFD97D54);
Color beige = const Color(0xFFB9B0A2);
Color lightGrey = Colors.grey.shade300;
Color darkGrey = Colors.grey.shade600;
Color totoColor = const Color(0xFFE95068);
Color mainColor = const Color(0xFFFBD0B1);
Color twoColor = const Color(0xFFE8E5E5);
String systemId ='w1NNiqgkQ1NlRJklRg3Th6qHMps1';



const String serverToken = 'AAAApauI2XA:APA91bH3RBNGc4jsgpy6dvQ4DX0QYFxORbrEFVxrzl88NnyTQOu8U39cAeVXEVYuWvZtIcjf6k2J03QDci8H25v3o5XQfgSTVJPuB8thglkFENXdpO8EdwDMjBvkhLdLwMdjeJOJT5rp';
// final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

double sizeFromHeight(BuildContext context, double fraction,
    {bool hasAppBar = false}) {
  final screenHeight = MediaQuery.of(context).size.height;
  final calculateHeight = (hasAppBar
          ? (screenHeight -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top)
          : screenHeight) /
      fraction;
  return calculateHeight;
}

double sizeFromWidth(BuildContext context, double fraction) {
  final calculateWidth = MediaQuery.of(context).size.width / fraction;
  return calculateWidth;
}


