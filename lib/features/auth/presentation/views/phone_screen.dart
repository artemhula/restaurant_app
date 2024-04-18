import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/arguments/otp_screen_arguments.dart';
import 'package:restaurant/features/auth/presentation/views/otp_screen.dart';
import 'package:restaurant/features/auth/presentation/widgets/phone_field.dart';
import 'package:restaurant/common/widgets/primary_button.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({super.key});

  static const routeName = '/phone';

  final _numberController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Введіть свій номер телефону',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              Text(
                'Ми надішлемо вам SMS-повідомлення на нього',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              PhoneField(
                numberController: _numberController,
                codeController: _codeController,
              ),
              const SizedBox(height: 20),
              ValueListenableBuilder(
                valueListenable: _numberController,
                builder: (context, value, child) {
                  return _numberController.text.length < 11 &&
                          _numberController.text.length > 7
                      ? PrimaryButton(
                          onPressed: () {
                            context.read<AuthCubit>().sendCodeToPhone(
                                  phoneNumber:
                                      '+${_codeController.text}${_numberController.text}',
                                );
                            Navigator.pushReplacementNamed(
                              context,
                              OTPScreen.routeName,
                              arguments: OTPScreenArguments(
                                  phoneNumber:
                                      '+${_codeController.text}${_numberController.text}'),
                            );
                          },
                          text: 'Далі',
                        )
                      : Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
