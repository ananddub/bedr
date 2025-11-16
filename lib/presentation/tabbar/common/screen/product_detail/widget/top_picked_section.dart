import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bedr/data/api/models/property.dart';

class TopPickedSection extends StatelessWidget {
  final List<Property> properties;

  const TopPickedSection({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Text(
            'Top Picked Options in Mumbai',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 2.h),
        SizedBox(
          height: 35.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            itemCount: properties.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: _buildPropertyCard(properties[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPropertyCard(Property property) {
    final imageUrl = property.propertyImages.isNotEmpty
        ? property.propertyImages[0].propImgM2.imageUrl
        : '';

    final amenities = ['Bed', 'Study Table', 'Wardrobe', 'AC', 'Geyser', 'Wi-Fi'];
    final displayAmenities = amenities.take(2).toList();
    final moreCount = amenities.length - 2;

    return Container(
      width: 70.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(3.w)),
            child: imageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 18.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 18.h,
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 18.h,
                      color: Colors.grey[200],
                      child: const Icon(Icons.image, size: 50),
                    ),
                  )
                : Container(
                    height: 18.h,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, size: 50),
                  ),
          ),

          Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property.displayName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 0.5.h),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, size: 14.sp, color: Colors.grey[600]),
                    SizedBox(width: 1.w),
                    Expanded(
                      child: Text(
                        '${property.locality}, ${property.city}',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                // Amenities
                Wrap(
                  spacing: 2.w,
                  children: [
                    ...displayAmenities.map((amenity) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(_getAmenityIcon(amenity), size: 14.sp, color: Colors.grey[700]),
                            SizedBox(width: 1.w),
                            Text(
                              amenity,
                              style: TextStyle(fontSize: 11.sp, color: Colors.grey[700]),
                            ),
                          ],
                        )),
                    if (moreCount > 0)
                      Text(
                        '+$moreCount more',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Text(
                      'From ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '₹${property.rentAmount}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '/month',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getAmenityIcon(String amenity) {
    switch (amenity.toLowerCase()) {
      case 'bed':
        return Icons.bed_outlined;
      case 'study table':
        return Icons.table_restaurant_outlined;
      case 'wardrobe':
        return Icons.checkroom_outlined;
      case 'ac':
        return Icons.ac_unit;
      case 'geyser':
        return Icons.water_drop_outlined;
      case 'wi-fi':
        return Icons.wifi;
      default:
        return Icons.check_circle_outline;
    }
  }
}
