import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController numberController;
  final TextEditingController codeController;
  const PhoneField({
    super.key,
    required this.numberController,
    required this.codeController,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
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

  @override
  void initState() {
    super.initState();
    widget.codeController.text = country.phoneCode;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.numberController,
      onChanged: (value) {
        setState(() {
          widget.numberController.text = value;
        });
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: Theme.of(context).textTheme.labelLarge,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 5),
          child: InkWell(
            onTap: () {
              showCountryPicker(
                context: context,
                onSelect: (Country value) {
                  setState(() {
                    country = value;
                    widget.codeController.text = country.phoneCode;
                  });
                },
                countryListTheme: CountryListThemeData(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  inputDecoration: InputDecoration(
                    hintText: 'Пошук',
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    contentPadding: const EdgeInsets.only(left: 20),
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
        ),
      ),
    );
  }
}
