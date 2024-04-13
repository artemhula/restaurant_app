import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final theme = ThemeData(
  textTheme: const TextTheme(
    bodySmall: TextStyle(fontSize: 10),
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 101, 0, 89),
    ),
    headlineSmall: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
    headlineMedium: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
  ),
  scaffoldBackgroundColor: Colors.black,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 105, 0, 96),
    foregroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 105, 0, 100),
      secondary: Color.fromARGB(13, 255, 255, 255),
      tertiary: Colors.grey),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Color.fromARGB(255, 14, 14, 14),
  ),
);

final defaultPinTheme = PinTheme(
  width: 50,
  height: 56,
  decoration: BoxDecoration(
    color: theme.colorScheme.secondary,
    borderRadius: BorderRadius.circular(8),
    border: Border.all(color: theme.colorScheme.secondary),
  ),
);
