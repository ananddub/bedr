import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';

class FilterSection extends StatelessWidget {
  final String title;
  final List<String> options;
  final List<String> selectedValues;
  final Function(String) onToggle;
  final bool singleSelect;

  const FilterSection({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValues,
    required this.onToggle,
    this.singleSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.5.h),
        Wrap(
          spacing: 2.w,
          runSpacing: 1.h,
          children: options.map((option) {
            final isSelected = selectedValues.contains(option.toLowerCase());
            return FilterChip(
              label: Text(option),
              selected: isSelected,
              onSelected: (_) => onToggle(option.toLowerCase()),
              selectedColor: AppTheme.btnColor,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14.sp,
              ),
              backgroundColor: Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.w),
              ),
              checkmarkColor: Colors.white,
            );
          }).toList(),
        ),
      ],
    );
  }
}
