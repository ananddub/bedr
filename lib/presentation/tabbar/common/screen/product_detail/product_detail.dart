import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';
import 'package:bedr/data/api/models/property.dart' as api;
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/image_carousel.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/property_header.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/room_list.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/amenities_section.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/services_section.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/policies_section.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/book_now_section.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/nearby_locations_section.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/widget/similar_properties_section.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/provider/similar_properties_provider.dart';
import 'package:bedr/data/db/database_provider.dart';
import 'package:bedr/presentation/common/provider/favourites_provider.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final api.Property property;

  const ProductDetailScreen({super.key, required this.property});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late final SimilarPropertiesNotifier _similarNotifier;
  late final FavouritesNotifier _favouritesNotifier;

  @override
  void initState() {
    super.initState();
    _similarNotifier = SimilarPropertiesNotifier();
    _similarNotifier.loadSimilarProperties(widget.property.locality);
    _favouritesNotifier = FavouritesNotifier(DatabaseProvider.instance);
  }

  @override
  void dispose() {
    _similarNotifier.dispose();
    _favouritesNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // App Bar with Back and Share
          SliverAppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),

          // Content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Carousel
                ImageCarousel(images: widget.property.propertyImages),

                SizedBox(height: 2.h),

                // Property Header
                PropertyHeader(property: widget.property),

                SizedBox(height: 3.h),

                // Rooms Section
                RoomList(rooms: widget.property.rooms),

                SizedBox(height: 3.h),

                // Amenities Section
                AmenitiesSection(property: widget.property),

                SizedBox(height: 3.h),

                // Services Section
                ServicesSection(property: widget.property),

                SizedBox(height: 3.h),

                // Policies Section
                const PoliciesSection(),

                SizedBox(height: 3.h),

                // Book Now Section
                const BookNowSection(),

                SizedBox(height: 3.h),

                // Nearby Locations Section
                const NearbyLocationsSection(),

                // Similar Properties Section
                ValueListenableBuilder<SimilarPropertiesState>(
                  valueListenable: _similarNotifier,
                  builder: (context, state, _) {
                    print(
                      'Similar section builder - isLoading: ${state.isLoading}, properties: ${state.properties.length}',
                    );
                    if (state.isLoading || state.properties.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        SizedBox(height: 3.h),
                        SimilarPropertiesSection(
                          locality: widget.property.locality,
                          properties: state.properties,
                        ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 2.h),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 5.5.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.btnColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 3.w),
            ValueListenableBuilder<Set<int>>(
              valueListenable: _favouritesNotifier,
              builder: (context, favourites, child) {
                final isFav = favourites.contains(widget.property.id);
                return GestureDetector(
                  onTap: () =>
                      _favouritesNotifier.toggleFavourite(widget.property),
                  child: Container(
                    height: 5.5.h,
                    width: 5.5.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.w),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.grey[600],
                      size: 22.sp,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
