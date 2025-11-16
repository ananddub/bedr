import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/data/api/models/property.dart';

class ServicesSection extends StatelessWidget {
  final Property property;

  const ServicesSection({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    // Mock services - replace with actual data
    final services = [
      {'icon': Icons.cleaning_services, 'label': 'Housekeeping'},
      {'icon': Icons.local_laundry_service, 'label': 'Washing Area'},
      {'icon': Icons.water_drop, 'label': 'RO Water'},
      {'icon': Icons.security, 'label': '24/7 Security'},
      {'icon': Icons.videocam, 'label': 'CCTV Surveillance'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3.w),
            ),
            child: Wrap(
              spacing: 3.w,
              runSpacing: 2.h,
              children: services.map((service) => Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.w),
                  border: Border.all(color: Colors.grey[200]!),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      service['icon'] as IconData,
                      size: 18.sp,
                      color: Colors.grey[700],
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      service['label'] as String,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
