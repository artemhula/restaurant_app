import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/common/widgets/primary_button.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/menu/presentation/views/arguments/main_screen_arguments.dart';
import 'package:restaurant/features/menu/presentation/views/main_screen.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});
  static const routeName = '/order_success';

  @override
  _OrderSuccessScreenState createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userState = context.read<UserCubit>().state;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Icon(
                    Icons.done_rounded,
                    size: 120,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Замовлення створено!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            PrimaryButton(
              onPressed: () {
                if (userState is UserLoaded) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    MainScreen.routeName,
                    (_) => false,
                    arguments: MainScreenArguments(user: userState.user),
                  );
                }
              },
              text: 'Назад до головного екрану',
            ),
          ],
        ),
      ),
    );
  }
}
