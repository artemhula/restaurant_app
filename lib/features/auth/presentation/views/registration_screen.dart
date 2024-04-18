import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/auth/presentation/widgets/error_snackbar.dart';
import 'package:restaurant/features/auth/presentation/widgets/registration_form.dart';
import 'package:restaurant/features/menu/presentation/views/arguments/main_screen_arguments.dart';
import 'package:restaurant/features/menu/presentation/views/main_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  static const routeName = '/registration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserIsNotRegistered) {
            return RegistrationForm(
              onRegister: (name, sex) {
                context.read<RegistrationCubit>().register(name, sex);
              },
            );
          }
          if (state is UserIsRegistered) {
            context.read<UserCubit>().receiveUser();
            Navigator.pushReplacementNamed(
              context,
              MainScreen.routeName,
              arguments: MainScreenArguments(user: state.user),
            );
          }
          if (state is RegistrationFailure) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(getErrorSnackbar(state.message));
            });
          }
          return Container();
        },
      ),
    );
  }
}
