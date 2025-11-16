import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sizer/sizer.dart';
import 'package:amicons/amicons.dart';
import 'package:bedr/app/theme.dart';
import 'package:bedr/data/api/models/recommended_response.dart';
import 'package:bedr/data/api/models/property.dart' as api;
import 'package:bedr/data/db/database_provider.dart';
import 'package:bedr/presentation/common/provider/favourites_provider.dart';
import 'package:bedr/util/image_cache_manager.dart';

class RecommendedCard extends StatefulWidget {
  final RecommendedItem item;

  const RecommendedCard({super.key, required this.item});

  @override
  State<RecommendedCard> createState() => _RecommendedCardState();
}

class _RecommendedCardState extends State<RecommendedCard> {
  late FavouritesNotifier _notifier;

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
    final property = widget.item.property;
    final imageUrl = property.propertyImages.isNotEmpty
        ? property.propertyImages.first.propImgM2.imageUrl
        : '';
    
    // Get rent from rooms if property rentAmount is 0
    final rent = property.rentAmount != '0' 
        ? property.rentAmount 
        : (property.rooms.isNotEmpty ? property.rooms.first.rentAmount : '0');

    return Container(
      width: 70.w,
      margin: EdgeInsets.only(right: 3.w),
      child: Card(
        elevation: 8,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(3.w)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 18.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    cacheManager: ImageCacheManager.instance,
                    placeholder: (context, url) => Container(
                      height: 18.h,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 18.h,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
                Positioned(
                  top: 2.w,
                  right: 2.w,
                  child: _FavoriteButton(
                    notifier: _notifier,
                    property: property,
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
                    property.displayName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    children: [
                      Icon(
                        Amicons.vuesax_location,
                        size: 15.sp,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 1.w),
                      Expanded(
                        child: Text(
                          '${property.locality}, ${property.city}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    '₹$rent/month',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.btnColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final FavouritesNotifier notifier;
  final api.Property property;

  const _FavoriteButton({
    required this.notifier,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<int>>(
      valueListenable: notifier,
      builder: (context, favouriteIds, child) {
        final isFavorite = favouriteIds.contains(property.id);
        return GestureDetector(
          onTap: () => notifier.toggleFavourite(property),
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.9),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? AppTheme.btnColor : Colors.grey[600],
              size: 18.sp,
            ),
          ),
        );
      },
    );
  }
}
