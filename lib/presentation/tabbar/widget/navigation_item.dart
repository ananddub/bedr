import 'package:flutter/material.dart';

class NavigationItem extends BottomNavigationBarItem {
  NavigationItem({
    required IconData iconData,
    required IconData activeIconData,
    required String labelText,
  }) : super(
          icon: Icon(iconData),
          activeIcon: Icon(activeIconData),
          label: labelText,
        );
}
