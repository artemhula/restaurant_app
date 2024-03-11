import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/features/auth/presentation/otp_screen.dart';

class PhoneScreen extends StatefulWidget {
  PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final phoneController = TextEditingController();

  var country = Country(
    phoneCode: '380',
    countryCode: 'UA',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Ukraine',
    example: 'Ukraine',
    displayName: 'Ukraine',
    displayNameNoCountryCode: 'UA',
    e164Key: '',
  );

  String phoneNumber = '';

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
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    phoneNumber = '+${country.phoneCode}$value';
                  });
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                style: Theme.of(context).textTheme.labelLarge,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 20, bottom: 20, right: 5),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                            context: context,
                            onSelect: (Country value) {
                              country = value;
                            },
                            countryListTheme: CountryListThemeData(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                              inputDecoration: InputDecoration(
                                hintText: 'Пошук',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          '${country.flagEmoji} +${country.phoneCode}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                    hintText: 'Номер телефону',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    )),
              ),
              const SizedBox(height: 20),
              phoneNumber.length < 14 && phoneNumber.length > 10
                  ? TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPScreen(
                              phoneNumber: phoneNumber,
                            ),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.3,
                          MediaQuery.of(context).size.height * 0.055,
                        ),
                      ),
                      child: Text(
                        'Далі',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
