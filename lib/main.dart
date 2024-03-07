import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
          )),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
