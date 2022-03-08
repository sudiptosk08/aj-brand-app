import 'dart:async';

import 'package:flutter/material.dart';

class BottomNavBarVisibilityNotifier {
  ValueNotifier navBarStateNotifier = ValueNotifier(false);

  void hideBottomNavBar() {
    Future.delayed(Duration.zero, () async {
    navBarStateNotifier.value = true;
});
    
  }

  void showBottomNavBar() {
    Timer(const Duration(seconds: 0), () {
      navBarStateNotifier.value = false;
    });
  }
}

BottomNavBarVisibilityNotifier appValueNotifier =
    BottomNavBarVisibilityNotifier();
