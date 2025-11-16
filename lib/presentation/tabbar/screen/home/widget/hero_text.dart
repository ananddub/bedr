import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get Rent Discounts',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          'You need to find your perfect space,\nfaster and hassle-free',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
        ),
        SizedBox(height: 1.h),
        Text(
          'One-time payment. Valid for 90 days from purchase.',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 13.sp, color: Colors.white70),
        ),
      ],
    );
  }
}
