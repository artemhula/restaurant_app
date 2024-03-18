import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name = '';
  DateTime birthday = DateTime.now();
  bool isMan = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                      backgroundColor: Theme.of(context).colorScheme.secondary,
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
              Text('Стать', style: Theme.of(context).textTheme.headlineMedium),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Чоловіча'),
                      leading: Radio<bool>(
                        value: true,
                        groupValue: isMan,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              isMan = true;
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
                        groupValue: isMan,
                        onChanged: (bool? value) {
                          setState(() {
                            if (value != null) {
                              isMan = false;
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
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
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
      ),
    );
  }
}
