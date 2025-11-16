import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PoliciesSection extends StatelessWidget {
  const PoliciesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final policies = [
      'BedR does not handle security deposits or extra fees. These are paid directly to the property owner.',
      '30-Days Notice Period to Vacate',
      'Flexible Payments, Simplified',
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Policies',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Payment Terms',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            'Rules and Regulations',
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(3.w),
              border: Border.all(color: Colors.green[100]!),
            ),
            child: Column(
              children: policies.map((policy) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle, size: 20.sp, color: Colors.green[700]),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Text(
                            policy,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[800],
                              height: 1.4,
                            ),
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
