import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: non_constant_identifier_names
AppBarWidget() {
  return AppBar(
    elevation: 0,
    backgroundColor: const Color.fromARGB(255, 17, 17, 17),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: const [
            Icon(
              FontAwesomeIcons.noteSticky,
              color: Colors.yellow,
              size: 20,
            ),
            SizedBox(width: 10),
            Text("Noty"),
          ],
        ),
        const Icon(
          FontAwesomeIcons.plus,
          size: 18,
        )
      ],
    ),
  );
}
