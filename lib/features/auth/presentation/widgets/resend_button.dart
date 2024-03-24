import 'dart:async';
import 'package:flutter/material.dart';

class ResendButton extends StatefulWidget {
  const ResendButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<ResendButton> createState() => _ResendButtonState();
}

class _ResendButtonState extends State<ResendButton> {
  late Timer _timer;
  int _time = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_time > 0)
          Text(
            'Повторная отправка через $_time секунд',
            style: Theme.of(context).textTheme.labelLarge,
          )
        else
          Center(
            child: InkWell(
              onTap: () {
                widget.onTap();
                resetTimer();
              },
              child: Text(
                'Надіслати код ще раз',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
      ],
    );
  }

  void startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_time == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _time--;
          });
        }
      },
    );
  }

  void resetTimer() {
    setState(() {
      _time = 60;
      startTimer();
    });
  }
}
