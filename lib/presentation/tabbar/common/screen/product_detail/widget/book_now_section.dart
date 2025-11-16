import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';

class BookNowSection extends StatelessWidget {
  const BookNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '👉  Schedule a Visit',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: _buildVisitOption(
                  icon: Amicons.vuesax_video,
                  title: 'Video Tour',
                  price: '₹199',
                  onTap: () {},
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: _buildVisitOption(
                  icon: Icons.location_on_outlined,
                  title: 'Visit Property',
                  subtitle: '4 free visits',
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVisitOption({
    required IconData icon,
    required String title,
    String? price,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.w),
          border: Border.all(color: AppTheme.btnColor.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32.sp, color: AppTheme.btnColor),
            SizedBox(height: 1.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 0.3.h),
            if (price != null)
              Text(
                price,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
              ),
            if (subtitle != null)
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.green[700],
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
