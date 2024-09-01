import 'package:flutter/material.dart' as navigators;

import '../../main.dart';

showMessage(String message) {
  navigators.ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
    navigators.SnackBar(
      content: navigators.Text(
        message,
        textAlign: navigators.TextAlign.center,
      ),
      duration: const Duration(seconds: 3),
      behavior: navigators.SnackBarBehavior.floating,
    ),
  );
}

Future pagePush(navigators.Widget newPage) async => await navigators.Navigator.push(
    navKey.currentContext!, navigators.MaterialPageRoute(builder: (context) => newPage));

dynamic pagePop([var x]) {
  return navigators.Navigator.pop(navKey.currentContext!, x);
}

Future pageReplacement(navigators.Widget newPage) async =>
    await navigators.Navigator.pushReplacement(
        navKey.currentContext!, navigators.MaterialPageRoute(builder: (_) => newPage));
