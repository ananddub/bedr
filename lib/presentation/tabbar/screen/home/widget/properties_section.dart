import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/app/theme.dart';
import 'package:bedr/presentation/tabbar/screen/home/provider/home_provider.dart';
import 'package:bedr/presentation/tabbar/screen/home/widget/recommended_card.dart';

class PropertiesSection extends ConsumerWidget {
  const PropertiesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNotifier = ref.watch(homeProvider);

    return ValueListenableBuilder<HomeState>(
      valueListenable: homeNotifier,
      builder: (context, state, child) {
        if (state.recommendedItems == null || state.recommendedItems!.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        const TextSpan(text: 'Recommended for '),
                        TextSpan(
                          text: 'you',
                          style: TextStyle(color: AppTheme.btnColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            SizedBox(
              height: 32.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(4.w, 0, 4.w, 2.w),
                itemCount: state.recommendedItems!.length,
                itemBuilder: (context, index) {
                  final item = state.recommendedItems![index];
                  return RecommendedCard(item: item);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
