import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';
import 'package:bedr/presentation/tabbar/screen/home/provider/home_provider.dart';
import 'package:bedr/presentation/common/widgets/property_card.dart';

class TopPropertiesSection extends ConsumerWidget {
  const TopPropertiesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNotifier = ref.watch(homeProvider);

    return ValueListenableBuilder<HomeState>(
      valueListenable: homeNotifier,
      builder: (context, state, child) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.error != null) {
          return Center(child: Text('Error: ${state.error}'));
        }

        if (state.properties?.data.docs.isEmpty ?? true) {
          return const Center(child: Text('No properties found'));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'Top '),
                    TextSpan(
                      text: 'Properties',
                      style: TextStyle(color: AppTheme.btnColor),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              itemCount: state.properties!.data.docs.length > 3 ? 3 : state.properties!.data.docs.length,
              itemBuilder: (context, index) {
                final property = state.properties!.data.docs[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 3.w),
                  child: PropertyCard(property: property),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
