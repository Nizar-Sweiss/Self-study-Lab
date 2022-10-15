import 'package:flutter/material.dart';

List colors = [
  Colors.red.shade200,
  Colors.orange.shade200,
  Colors.yellow.shade200,
  Colors.green.shade200,
  Colors.blue.shade200,
];
Color getColor() => (colors..shuffle()).first;