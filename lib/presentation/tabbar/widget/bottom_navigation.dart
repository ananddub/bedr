import 'package:flutter/material.dart';
import 'package:amicons/amicons.dart';
import 'package:bedr/app/theme.dart';
import 'package:bedr/presentation/tabbar/widget/navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppTheme.cardColor,
      selectedItemColor: AppTheme.btnColor,
      items: [
        NavigationItem(
          iconData: Amicons.iconly_home,
          activeIconData: Amicons.iconly_home_fill,
          labelText: 'Home',
        ),
        NavigationItem(
          iconData: Amicons.iconly_search,
          activeIconData: Amicons.iconly_search_fill,
          labelText: 'Filter',
        ),
        NavigationItem(
          iconData: Amicons.iconly_heart,
          activeIconData: Amicons.iconly_heart_fill,
          labelText: 'Favorites',
        ),
        NavigationItem(
          iconData: Amicons.vuesax_user,
          activeIconData: Amicons.vuesax_user_fill,
          labelText: 'Settings',
        ),
      ],
    );
  }
}
