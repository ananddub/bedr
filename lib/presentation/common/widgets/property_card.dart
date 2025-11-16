import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:bedr/data/api/models/property.dart' as api;
import 'package:bedr/app/theme.dart';
import 'package:bedr/app/constant.dart';
import 'package:bedr/data/db/database_provider.dart';
import 'package:bedr/presentation/common/provider/favourites_provider.dart';
import 'package:bedr/util/image_cache_manager.dart';

class PropertyCard extends StatefulWidget {
  final api.Property property;

  const PropertyCard({super.key, required this.property});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  late final FavouritesNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = FavouritesNotifier(DatabaseProvider.instance);
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = widget.property.propertyImages.isNotEmpty
        ? widget.property.propertyImages[0].propImgM2.imageUrl
        : '';

    final amenities = [
      _AmenityData(
        widget.property.accommodationType.capitalize(),
        Icons.person_outline,
      ),
      _AmenityData(widget.property.propertyType.toUpperCase(), Icons.home_outlined),
      _AmenityData('Bed', Icons.bed_outlined),
      _AmenityData('Study Table', Icons.table_restaurant_outlined),
      _AmenityData('Wardrobe', Icons.checkroom_outlined),
      _AmenityData('Ro Water', Icons.water_drop_outlined),
    ];

    return SizedBox(
      width: 85.w,
      child: GestureDetector(
      onTap: () => context.push(AppRoutes.propertyDetail, extra: widget.property),
      child: Container(
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(3.w)),
                  child: imageUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 22.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          cacheManager: ImageCacheManager.instance,
                          placeholder: (context, url) => Container(
                            height: 22.h,
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            height: 22.h,
                            width: double.infinity,
                            color: Colors.grey[200],
                            child: Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: 40.sp,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 22.h,
                          width: double.infinity,
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 40.sp,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                ),
                Positioned(
                  top: 2.w,
                  right: 2.w,
                  child: ValueListenableBuilder<Set<int>>(
                    valueListenable: _notifier,
                    builder: (context, favourites, child) {
                      final isFav = favourites.contains(widget.property.id);
                      return GestureDetector(
                        onTap: () => _notifier.toggleFavourite(widget.property),
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : Colors.grey[600],
                            size: 20.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.property.displayName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 0.8.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 18.sp,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 1.w),
                      Expanded(
                        child: Text(
                          '${widget.property.locality}, ${widget.property.city}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    children: [
                      Icon(
                        Icons.near_me_outlined,
                        size: 18.sp,
                        color: AppTheme.btnColor,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        '${widget.property.distance.toStringAsFixed(1)} KM From Searched Location',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppTheme.btnColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.2.h),
                  Wrap(
                    spacing: 2.w,
                    runSpacing: 0.8.h,
                    children: [
                      ...amenities
                          .take(4)
                          .map((a) => _buildAmenity(a.label, a.icon)),
                      if (amenities.length > 4)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 0.5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(1.w),
                          ),
                          child: Text(
                            '+${amenities.length - 4} more',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 1.5.h),
                  Row(
                    children: [
                      Text(
                        'From ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        '₹${widget.property.rentAmount}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        '/month',
                        style: TextStyle(
                          fontSize: 14.sp,
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
      ),
    ),
    );
  }

  Widget _buildAmenity(String label, IconData icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18.sp, color: Colors.grey[700]),
        SizedBox(width: 1.w),
        Text(
          label,
          style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
        ),
      ],
    );
  }
}

class _AmenityData {
  final String label;
  final IconData icon;
  _AmenityData(this.label, this.icon);
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
