import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';
import 'package:bedr/presentation/tabbar/screen/filter/provider/filter_provider.dart';
import 'package:bedr/presentation/tabbar/screen/filter/widget/filter_section.dart';
import 'package:bedr/presentation/tabbar/screen/filter/widget/budget_slider.dart';

class FilterBottomSheet extends ConsumerWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterNotifier = ref.watch(filterProvider);

    return ValueListenableBuilder<FilterState>(
      valueListenable: filterNotifier,
      builder: (context, state, child) {
        return Container(
          constraints: BoxConstraints(maxHeight: 85.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(5.w)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 1.5.h),
                width: 12.w,
                height: 0.5.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(1.w),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filters',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => filterNotifier.clearAll(),
                      child: Text(
                        'Clear All',
                        style: TextStyle(
                          color: AppTheme.btnColor,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: Colors.grey[300]),
              Flexible(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FilterSection(
                        title: 'Gender',
                        options: const ['Boys', 'Girls', 'Co-living'],
                        selectedValues: state.selectedGender != null ? [state.selectedGender!] : [],
                        onToggle: (value) => filterNotifier.selectGender(
                          state.selectedGender == value ? null : value
                        ),
                        singleSelect: true,
                      ),
                      SizedBox(height: 3.h),
                      FilterSection(
                        title: 'Property Type',
                        options: const ['PG', 'Hostel', 'Flat'],
                        selectedValues: state.propertyTypes,
                        onToggle: (value) => filterNotifier.togglePropertyType(value),
                      ),
                      SizedBox(height: 3.h),
                      FilterSection(
                        title: 'Room Type',
                        options: const ['Private', 'Sharing-2', 'Sharing-3', 'Sharing-4+'],
                        selectedValues: state.roomTypes,
                        onToggle: (value) => filterNotifier.toggleRoomType(value),
                      ),
                      SizedBox(height: 3.h),
                      BudgetSlider(
                        budgetRange: state.budgetRange,
                        onChanged: (range) => filterNotifier.setBudgetRange(range),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 6.h,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.btnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                    ),
                    child: Text(
                      'Apply Filters',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
