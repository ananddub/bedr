import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:amicons/amicons.dart';
import 'package:bedr/data/db/database_provider.dart';
import 'package:bedr/presentation/tabbar/screen/favourites/provider/favourites_screen_provider.dart';
import 'package:bedr/presentation/common/widgets/property_card.dart';
import 'package:bedr/presentation/tabbar/screen/filter/widget/filter_bottom_sheet.dart';

class FavouritesScreen extends ConsumerStatefulWidget {
  const FavouritesScreen({super.key});

  @override
  ConsumerState<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends ConsumerState<FavouritesScreen> {
  late final FavouritesScreenNotifier _notifier;

  @override
  void initState() {
    super.initState();
    _notifier = FavouritesScreenNotifier(DatabaseProvider.instance);
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Row(
                children: [
                  Text(
                    'Favourite',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: _showFilterBottomSheet,
                    child: Icon(Amicons.iconly_filter, size: 24.sp),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ValueListenableBuilder<FavouritesScreenState>(
                valueListenable: _notifier,
                builder: (context, state, child) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.error != null) {
                    return Center(child: Text('Error: ${state.error}'));
                  }

                  if (state.properties.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border, size: 80.sp, color: Colors.grey[400]),
                          SizedBox(height: 2.h),
                          Text(
                            'No favourites yet',
                            style: TextStyle(fontSize: 18.sp, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    itemCount: state.properties.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: PropertyCard(property: state.properties[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
