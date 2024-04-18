import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/phone_screen.dart';
import 'package:restaurant/features/menu/presentation/views/arguments/main_screen_arguments.dart';
import 'package:restaurant/features/menu/presentation/views/main_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  static const routeName = '/initial';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserCubit>().receiveUser();
    });
    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserLoaded) {
            Navigator.pushReplacementNamed(
              context,
              MainScreen.routeName,
              arguments: MainScreenArguments(user: state.user),
            );
          }
          if (state is UserNotLoaded) {
            Navigator.pushReplacementNamed(context, PhoneScreen.routeName);
          }
        },
        builder: (BuildContext context, UserState state) {
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          }
          if (state is UserFailure) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
