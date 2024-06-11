import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/arguments/otp_screen_arguments.dart';
import 'package:restaurant/features/auth/presentation/views/registration_screen.dart';
import 'package:restaurant/common/widgets/error_snackbar.dart';
import 'package:restaurant/features/auth/presentation/widgets/otp_field.dart';
import 'package:restaurant/features/auth/presentation/widgets/resend_button.dart';
import 'package:restaurant/features/menu/presentation/views/arguments/main_screen_arguments.dart';
import 'package:restaurant/features/menu/presentation/views/main_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  static const routeName = '/otp';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as OTPScreenArguments;
    final phoneNumber = args.phoneNumber;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocListener<RegistrationCubit, RegistrationState>(
          listener: (context, state) {
            if (state is UserIsRegistered) {
              context.read<UserCubit>().receiveUser();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(
                  context,
                  MainScreen.routeName,
                  arguments: MainScreenArguments(user: state.user),
                );
              });
            } else if (state is UserIsNotRegistered) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(
                    context, RegistrationScreen.routeName);
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
                  const SizedBox(height: 20),
                  ResendButton(
                    onTap: () {
                      context
                          .read<AuthCubit>()
                          .sendCodeToPhone(phoneNumber: phoneNumber);
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
