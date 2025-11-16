import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/presentation/tabbar/screen/home/widget/hero_text.dart';

class HeroOverlay extends StatelessWidget {
  const HeroOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.6),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: const HeroText(),
      ),
    );
  }
}
