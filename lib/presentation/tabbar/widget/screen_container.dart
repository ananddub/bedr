import 'package:bedr/presentation/tabbar/screen/favourites/favourites.dart';
import 'package:flutter/material.dart';
import 'package:bedr/presentation/tabbar/screen/home/home.dart';
import 'package:bedr/presentation/tabbar/screen/filter/filter.dart';
import 'package:bedr/presentation/tabbar/screen/setting/setting_screen.dart';

class ScreenContainer extends StatelessWidget {
  final int currentIndex;

  const ScreenContainer({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const FilterScreen(),
      const FavouritesScreen(),
      const SettingScreen(),
    ];

    return screens[currentIndex];
  }
}
