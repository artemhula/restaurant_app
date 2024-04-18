import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/common/theme.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/hello_screen.dart';
import 'package:restaurant/features/auth/presentation/views/otp_screen.dart';
import 'package:restaurant/features/auth/presentation/views/phone_screen.dart';
import 'package:restaurant/features/auth/presentation/views/registration_screen.dart';
import 'package:restaurant/features/menu/presentation/views/main_screen.dart';
import 'package:restaurant/utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthCubit>()),
        BlocProvider(create: (context) => sl<RegistrationCubit>()),
        BlocProvider(create: (context) => sl<UserCubit>())
      ],
      child: MaterialApp(
        theme: theme,
        home: const InitialScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          InitialScreen.routeName: (context) => const InitialScreen(),
          PhoneScreen.routeName:(context) => PhoneScreen(),
          OTPScreen.routeName: (context) => const OTPScreen(),
          RegistrationScreen.routeName: (context) => const RegistrationScreen(),
          MainScreen.routeName:(context) => const MainScreen(),
        },
      ),
    );
  }
}
