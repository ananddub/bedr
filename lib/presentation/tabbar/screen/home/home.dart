import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:amicons/amicons.dart';
import 'package:bedr/app/constant.dart';
import 'package:bedr/app/theme.dart';
import 'package:bedr/presentation/tabbar/screen/home/widget/hero_section.dart';
import 'package:bedr/presentation/tabbar/screen/home/widget/properties_section.dart';
import 'package:bedr/presentation/tabbar/screen/home/widget/top_properties_section.dart';
import 'package:bedr/presentation/tabbar/screen/home/provider/home_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final homeNotifier = ref.read(homeProvider);
      homeNotifier.initializeIfNeeded(); // Only loads once
      homeNotifier.loadRecommendedProperties();
    });

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final homeNotifier = ref.read(homeProvider);
      homeNotifier.loadMoreProperties();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeNotifier = ref.watch(homeProvider);
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 4.w),
        titleSpacing: 5.w,
        title: SvgPicture.asset(
          'assets/images/logo_mobile.svg',
          height: 4.h,
          colorFilter: ColorFilter.mode(AppTheme.btnColor, BlendMode.srcIn),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => context.go(AppRoutes.login),
            icon: const Icon(Amicons.vuesax_user),
          ),
        ],
      ),
      body: ValueListenableBuilder<HomeState>(
        valueListenable: homeNotifier,
        builder: (context, state, child) {
          final hasRecommended = state.recommendedItems?.isNotEmpty ?? false;
          
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const HeroSection(),
                SizedBox(height: 4.h),
                const PropertiesSection(),
                if (hasRecommended) SizedBox(height: 4.h),
                const TopPropertiesSection(),
                if (state.isLoadingMore)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                SizedBox(height: 4.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
