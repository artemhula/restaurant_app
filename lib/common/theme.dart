import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

final theme = ThemeData(
  textTheme: const TextTheme(
    labelLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w300,
    ),
    labelMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Color.fromARGB(255, 20, 101, 0),
    ),
    headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    headlineMedium: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
  ),
  scaffoldBackgroundColor: Colors.black,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color.fromARGB(255, 21, 105, 0),
    foregroundColor: Colors.white,
  ),
  colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 21, 105, 0),
      secondary: Colors.white12,
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
        border: Border.all(color: Colors.transparent),
      ),
    );