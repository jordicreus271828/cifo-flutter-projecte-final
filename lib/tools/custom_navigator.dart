import 'package:flutter/material.dart';

// Syntactic sugar class for Navigator.push

class CustomNavigator {
  static void push(BuildContext context, Widget target) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => target),
    );
  }
}
