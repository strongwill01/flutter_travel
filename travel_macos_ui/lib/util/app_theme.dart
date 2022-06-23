import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get mode => _themeMode;
  set mode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
