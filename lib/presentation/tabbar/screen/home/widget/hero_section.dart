import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';
import 'package:bedr/presentation/tabbar/screen/home/widget/hero_overlay.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.w),
      child: Card(
        elevation: 4,
        shadowColor: AppTheme.shadowColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
        child: Container(
          width: double.infinity,
          height: 25.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.w),
            image: const DecorationImage(
              image: NetworkImage(
                'https://bedr-blog-content.s3.ap-south-1.amazonaws.com/Hero_Section_Mobile.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: const HeroOverlay(),
        ),
      ),
    );
  }
}
