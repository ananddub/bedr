import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';

class CookieNotice extends StatelessWidget {
  final VoidCallback onAccept;

  const CookieNotice({super.key, required this.onAccept});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
    return Container(
      padding: EdgeInsets.all(4.w),
      color: AppTheme.cardColor,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'This site uses cookies from Google to deliver and enhance the quality of its services and to analyze traffic.',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          SizedBox(width: 2.w),
          SizedBox(
            height: 5.h,
            child: ElevatedButton(
              onPressed: onAccept,
              child: Text('Accept', style: TextStyle(fontSize: 14.sp)),
            ),
          ),
        ],
      ),
    );
  }
}
