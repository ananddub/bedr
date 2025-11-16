import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const AdaptiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (Device.screenType == ScreenType.tablet && tablet != null) {
      return tablet!;
    }
    return mobile;
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double spacing;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.spacing = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = Device.screenType == ScreenType.tablet ? 3 : 2;
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing.w,
        mainAxisSpacing: spacing.w,
        childAspectRatio: Device.screenType == ScreenType.tablet ? 1.2 : 0.8,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

class AdaptiveContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const AdaptiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.all(Device.screenType == ScreenType.tablet ? 6.w : 4.w),
      margin: margin ?? EdgeInsets.all(Device.screenType == ScreenType.tablet ? 3.w : 2.w),
      child: child,
    );
  }
}
