import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';

class BudgetSlider extends StatelessWidget {
  final RangeValues budgetRange;
  final Function(RangeValues) onChanged;

  const BudgetSlider({
    super.key,
    required this.budgetRange,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Budget Range',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹${budgetRange.start.toInt()}',
              style: TextStyle(
                fontSize: 15.sp,
                color: AppTheme.btnColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '₹${budgetRange.end.toInt()}',
              style: TextStyle(
                fontSize: 15.sp,
                color: AppTheme.btnColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        RangeSlider(
          values: budgetRange,
          min: 0,
          max: 100000,
          divisions: 100,
          activeColor: AppTheme.btnColor,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
