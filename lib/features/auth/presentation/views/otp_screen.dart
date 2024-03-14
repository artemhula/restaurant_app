import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/home_screen.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 56,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                  Center(
                    child: SizedBox(
                      height: 64,
                      child: Pinput(
                        length: 6,
                        onCompleted: (pin) {
                          context.read<AuthCubit>().verifyCode(smsCode: pin);
                        },
                        keyboardType: TextInputType.number,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          width: 60,
                          height: 64,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is OtpVerified) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
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
    );
  }
}
