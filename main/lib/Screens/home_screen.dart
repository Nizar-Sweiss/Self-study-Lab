import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:main/widgets/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HomeScreenWidget(), ProfileScreenWidget()];

  void _activeTabWidget(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      bottomNavigationBar: BottomNavigationBarWidget(),
      appBar: AppBarWidget(context),
      body: _pages[_selectedIndex],
    );
  }

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
            onTabChange: (index) {
              _activeTabWidget(index);
            },
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
}
