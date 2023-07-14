// ignore_for_file: camel_case_types

import 'package:bhagvat_geeta_app_departure/utilse/routes_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settingsController extends ChangeNotifier {
  bool darkTheme = false;
  final String _varTheme = "is_dark";
  int currentIndex = 0;
  List pages = [
    AllRoutes.homePage,
    AllRoutes.favoritePage,
    AllRoutes.listOfsLock,
    AllRoutes.settingsPage,
  ];

  SharedPreferences pref;

  changeIndex({required int index}) {
    currentIndex = index;
    notifyListeners();
  }

  settingsController({required this.pref});

  bool get getTheme {
    if (pref.getBool(_varTheme) ?? false) {
      darkTheme = pref.getBool(_varTheme)!;
    } else {
      pref.setBool(_varTheme, darkTheme);
    }
    return darkTheme;
  }

  changeTheme() {
    darkTheme = !darkTheme;
    pref.setBool(_varTheme, darkTheme);
    notifyListeners();
  }
}
