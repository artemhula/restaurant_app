import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/registration_screen.dart';
import 'package:restaurant/features/auth/presentation/widgets/error_snackbar.dart';
import 'package:restaurant/features/auth/presentation/widgets/otp_field.dart';
import 'package:restaurant/home_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state is UserIsRegistered) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              });
            } else if (state is UserIsNotRegistered) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrationScreen()),
                );
              });
            }
          },
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(getErrorSnackbar(state.message));
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
              if (state is AuthOtpVerified) {
                context.read<RegistrationCubit>().checkIsUserRegistered();
              }
               return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Введіть код',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Ми надіcлали SMS-повідомлення на номер $phoneNumber',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    OtpField(
                      onCompleted: (pin) {
                        context.read<AuthCubit>().verifyCode(smsCode: pin);
                      },
                    ),
                  ],
                );
            },
          ),
        ),
      ),
    );
  }
}
