import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/data/api/models/property.dart';

class AmenitiesSection extends StatefulWidget {
  final Property property;

  const AmenitiesSection({super.key, required this.property});

  @override
  State<AmenitiesSection> createState() => _AmenitiesSectionState();
}

class _AmenitiesSectionState extends State<AmenitiesSection> {
  bool _showAll = false;

  final Map<String, IconData> _amenityIcons = {
    'bed': Icons.bed_outlined,
    'study table': Icons.table_restaurant_outlined,
    'wardrobe': Icons.checkroom_outlined,
    'geyser': Icons.water_drop_outlined,
    'in-house kitchen': Icons.kitchen_outlined,
    'wi-fi': Icons.wifi,
  };

  IconData _getIcon(String amenity) {
    final key = amenity.toLowerCase();
    return _amenityIcons[key] ?? Icons.check_circle_outline;
  }

  @override
  Widget build(BuildContext context) {
    final amenities = [
      'Bed',
      'Study Table',
      'Wardrobe',
      'Geyser',
      'In-house Kitchen',
      'Wi-Fi',
    ];

    final displayAmenities = _showAll ? amenities : amenities.take(6).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Amenities',
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
              children: displayAmenities.map((amenity) => Container(
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
                      _getIcon(amenity),
                      size: 18.sp,
                      color: Colors.grey[700],
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      amenity,
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
          if (amenities.length > 6)
            Padding(
              padding: EdgeInsets.only(top: 1.h),
              child: TextButton(
                onPressed: () => setState(() => _showAll = !_showAll),
                child: Text(
                  _showAll ? 'View Less' : 'View More',
                  style: TextStyle(fontSize: 14.sp, color: Colors.blue),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
