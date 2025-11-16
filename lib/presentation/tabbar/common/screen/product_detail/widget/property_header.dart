import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/data/api/models/property.dart';

class PropertyHeader extends StatelessWidget {
  final Property property;

  const PropertyHeader({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            property.displayName,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 1.h),

          // Location
          Text(
            '${property.locality}, ${property.city}',
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 2.h),

          // Property Info Row
          Row(
            children: [
              _buildInfoChip(Icons.home_outlined, property.propertyType.toUpperCase()),
              SizedBox(width: 2.w),
              _buildInfoChip(Icons.person_outline, property.accommodationType.capitalize()),
              SizedBox(width: 2.w),
              _buildInfoChip(Icons.check_circle_outline, 'Available Now', color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label, {Color? color}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.8.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(2.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16.sp, color: color ?? Colors.grey[700]),
          SizedBox(width: 1.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              color: color ?? Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
