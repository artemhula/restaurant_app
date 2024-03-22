import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/registration_screen.dart';
import 'package:restaurant/features/auth/presentation/widgets/otp_field.dart';
import 'package:restaurant/home_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

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
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
              if (state is OtpSended) {
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
                      'Ми надіcлали SMS-повідомлення на номер ${state.phoneNumber}',
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
              }
              if (state is OtpVerified) {
                context.read<RegistrationCubit>().checkIsUserRegistered();
              }
              if (state is AuthFailure) {
                return Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
