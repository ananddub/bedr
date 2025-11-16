import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static const Color btnColor = Color(0xFFf7553d);
  static const Color cardColor = Color(0xFFffffff);
  static const Color shadowColor = Color(0x1A000000); // Light shadow

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: btnColor,
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      cardColor: cardColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 14.sp),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: btnColor),
      cardTheme: CardThemeData(
        color: cardColor,
        shadowColor: shadowColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 14.sp),
        bodyMedium: TextStyle(fontSize: 12.sp),
        titleLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
