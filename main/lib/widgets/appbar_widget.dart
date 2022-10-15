import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main/widgets/widgets.dart';

// ignore: non_constant_identifier_names
AppBarWidget(context) {
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
        GestureDetector(
          onTap: () {
            createOrUpdate(context);
          },
          child: const Icon(
            FontAwesomeIcons.plus,
            size: 18,
          ),
        )
      ],
    ),
  );
}
