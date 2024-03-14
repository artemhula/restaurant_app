import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/hello_screen.dart';
import 'package:restaurant/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: MaterialApp(
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
              headlineSmall:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              headlineMedium:
                  TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
              headlineLarge:
                  TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
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
        home: const AuthScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
