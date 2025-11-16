import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:bedr/app/constant.dart';
import 'package:bedr/presentation/splash/splash_screen.dart';
import 'package:bedr/presentation/auth/login_screen.dart';
import 'package:bedr/presentation/auth/register_screen.dart';
import 'package:bedr/presentation/tabbar/tabbar.dart';
import 'package:bedr/presentation/tabbar/common/screen/product_detail/product_detail.dart';
import 'package:bedr/data/api/models/property.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const MainTabbar(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.propertyDetail,
        name: 'propertyDetail',
        builder: (context, state) {
          final property = state.extra as Property;
          return ProductDetailScreen(property: property);
        },
      ),
    ],
  );
}
