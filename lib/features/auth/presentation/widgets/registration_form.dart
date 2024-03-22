import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/features/auth/presentation/widgets/primary_button.dart';

class RegistrationForm extends StatefulWidget {
  final Function(String, bool, DateTime) onRegister;

  const RegistrationForm({required this.onRegister, Key? key})
      : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String name = '';
  DateTime birthday = DateTime.now();
  bool sex = true;

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () async {
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
              child: PrimaryButton(
                onPressed: () {
                  widget.onRegister(name, sex, birthday);
                },
                text: 'Готово',
              ),
            )
          ],
        ),
      ),
    );
  }
}
