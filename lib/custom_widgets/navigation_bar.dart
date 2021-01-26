import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rate_me/static/Global.dart';
import 'package:rate_me/static/theme_data.dart';

class NavBarCustom extends StatefulWidget {
  @override
  _NavBarCustomState createState() => _NavBarCustomState();
}

class _NavBarCustomState extends State<NavBarCustom> {
  void _onItemTapped(int index) {
    setState(() {
      Global.selectedIndex = index;
      if (Global.selectedIndex == 0) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/peoplePage', ModalRoute.withName('/peoplePage'));
      } else if (Global.selectedIndex == 1) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/ratePage', ModalRoute.withName('/ratePage'));
      } else if (Global.selectedIndex == 2) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/profilePage', ModalRoute.withName('/profilePage'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'People',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: Global.selectedIndex,
      unselectedItemColor: CustomTheme.primary,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}
