import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:restaurant/common/theme.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    required this.onCompleted,
  });
  final Function(String pin) onCompleted;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 64,
        child: Pinput(
          length: 6,
          onCompleted: onCompleted,
          keyboardType: TextInputType.number,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyWith(
            width: 60,
            height: 64,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
