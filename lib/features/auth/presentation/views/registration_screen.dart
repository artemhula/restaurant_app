import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/features/auth/presentation/widgets/registration_form.dart';
import 'package:restaurant/home_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

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
              onRegister: (name, sex, birthday) {
                context.read<RegistrationCubit>().register(name, sex, birthday);
              },
            );
          }
          if (state is RegistrationSuccessful) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
          if (state is RegistrationFailure) {
            return const Center(child: Text('oh no!'));
          }
          return Container();
        },
      ),
    );
  }
}
