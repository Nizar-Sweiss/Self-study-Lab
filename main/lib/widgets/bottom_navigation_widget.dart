import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: non_constant_identifier_names
BottomNavigationBarWidget() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.black.withAlpha(180),
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GNav(
          color: Colors.white,
          activeColor: Colors.white,
          tabBorderRadius: 15,
          iconSize: 18,
          textSize: 20,
          gap: 15,
          onTabChange: (index) {},
          padding: const EdgeInsets.all(15),
          tabs: const [
            GButton(
              icon: FontAwesomeIcons.bookmark,
              text: "Notes",
              iconActiveColor: Colors.yellow,
              textColor: Colors.yellow,
            ),
            GButton(
              icon: FontAwesomeIcons.user,
              text: "Account",
              iconActiveColor: Colors.lightGreen,
              textColor: Colors.lightGreen,
            )
          ],
        ),
      ),
    ),
  );
}
