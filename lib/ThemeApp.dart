import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
      hintStyle: TextStyle(color: Colors.black),
      labelStyle: TextStyle(color: Colors.black),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      hintStyle: TextStyle(color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
  );

  final _darkThemeKey = 'isDarkTheme';
  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
  }
}
