import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:bedr/presentation/tabbar/provider/tabbar_provider.dart';
import 'package:bedr/presentation/tabbar/widget/bottom_navigation.dart';
import 'package:bedr/presentation/tabbar/widget/screen_container.dart';
import 'package:bedr/presentation/common/cookie_notice.dart';
import 'package:bedr/app/theme.dart';

class MainTabbar extends ConsumerWidget {
  const MainTabbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabbarNotifier = ref.watch(tabbarProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: tabbarNotifier,
              builder: (context, currentIndex, child) {
                return ScreenContainer(currentIndex: currentIndex);
              },
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: tabbarNotifier.showCookieNotice,
            builder: (context, showCookie, child) {
              if (!showCookie) return const SizedBox.shrink();
              return CookieNotice(
                onAccept: () => tabbarNotifier.hideCookieNotice(),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: tabbarNotifier,
        builder: (context, currentIndex, child) {
          return BottomNavigation(
            currentIndex: currentIndex,
            onTap: tabbarNotifier.changeTab,
          );
        },
      ),
    );
  }
}
