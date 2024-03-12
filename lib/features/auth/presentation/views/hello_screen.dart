import 'package:flutter/material.dart';
import 'package:restaurant/features/auth/presentation/views/phone_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Вітаємо!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhoneScreen()));
              },
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.3,
                      MediaQuery.of(context).size.height * 0.05)),
              child: Text(
                'Увійти',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
