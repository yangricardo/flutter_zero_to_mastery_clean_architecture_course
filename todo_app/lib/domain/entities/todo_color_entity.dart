import 'package:flutter/material.dart';

class ToDoColor {
  final int colorIndex;
  static const List<Color> predefinedColors = [
    Colors.red,
    Colors.blueGrey,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.teal,
    Colors.orange,
    Colors.pink
  ];

  Color get color => predefinedColors[colorIndex];

  ToDoColor({required this.colorIndex});
}
