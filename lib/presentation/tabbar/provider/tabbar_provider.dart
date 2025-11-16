import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabbarNotifier extends ValueNotifier<int> {
  TabbarNotifier() : super(0);

  final ValueNotifier<bool> showCookieNotice = ValueNotifier(true);

  void changeTab(int index) {
    value = index;
  }

  void hideCookieNotice() {
    showCookieNotice.value = false;
  }

  @override
  void dispose() {
    showCookieNotice.dispose();
    super.dispose();
  }
}

final tabbarProvider = Provider<TabbarNotifier>((ref) {
  final notifier = TabbarNotifier();
  ref.onDispose(() => notifier.dispose());
  return notifier;
});
