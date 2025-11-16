import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/data/api/models/property.dart';
import 'package:bedr/presentation/common/widgets/property_card.dart';

class SimilarPropertiesSection extends StatelessWidget {
  final String locality;
  final List<Property> properties;

  const SimilarPropertiesSection({
    super.key,
    required this.locality,
    required this.properties,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            'Similar PGs in $locality',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
          child: Row(
            children: properties.asMap().entries.map((entry) {
              return Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: PropertyCard(property: entry.value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
