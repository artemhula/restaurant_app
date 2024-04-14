import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/phone_screen.dart';
import 'package:restaurant/features/menu/presentation/views/main_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().recieveSavedUser();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        }
        if (state is UserNotLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PhoneScreen(),
            ),
          );
        }
        if (state is UserFailure) {
          return Center(child: Text(state.message));
        }
        return const Scaffold(
          body: Center(
            child: Text('LOGO'),
          ),
        );
      },
    );
  }
}
