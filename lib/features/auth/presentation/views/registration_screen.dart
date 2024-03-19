import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/home_screen.dart';
import 'package:restaurant/views/main_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String name = '';
  DateTime birthday = DateTime.now();
  bool sex = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          if (state is RegistrationLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserIsNotRegistered) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Давайте ми уточнимо дані про вас',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 40),
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter
                      ],
                      style: Theme.of(context).textTheme.headlineSmall,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'Ім\'я',
                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Дата народження\n${birthday.day}/${birthday.month}/${birthday.year}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() async {
                              DateTime? pickedBirthday = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1924),
                                lastDate: birthday,
                                currentDate: birthday,
                              );
                              if (pickedBirthday != null) {
                                setState(() {
                                  birthday = pickedBirthday;
                                });
                              }
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            foregroundColor: Colors.white,
                            fixedSize: Size(
                              MediaQuery.of(context).size.width * 0.3,
                              MediaQuery.of(context).size.height * 0.055,
                            ),
                          ),
                          child: const Text('Обрати'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text('Стать',
                        style: Theme.of(context).textTheme.headlineMedium),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text('Чоловіча'),
                            leading: Radio<bool>(
                              value: true,
                              groupValue: sex,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value != null) {
                                    sex = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Жіноча'),
                            leading: Radio<bool>(
                              value: false,
                              groupValue: sex,
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value != null) {
                                    sex = false;
                                  }
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<RegistrationCubit>()
                              .register(name, sex, birthday);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.3,
                            MediaQuery.of(context).size.height * 0.055,
                          ),
                        ),
                        child: Text(
                          'Готово',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is RegistrationSuccessful) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
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
