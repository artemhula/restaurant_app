import 'package:flutter/material.dart';
import 'package:restaurant/features/menu/presentation/views/arguments/main_screen_arguments.dart';
import 'package:restaurant/features/menu/presentation/widgets/cart_button.dart';
import 'package:restaurant/features/menu/presentation/widgets/category_tab_bar.dart';
import 'package:restaurant/features/menu/presentation/widgets/category_tab_view.dart';
import 'package:restaurant/features/menu/presentation/widgets/profile_button.dart';
import 'package:restaurant/utils/tabs.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const routeName = '/main';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as MainScreenArguments;
    final user = args.user;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/logo.png',
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          centerTitle: true,
          actions: const [
            ProfileButton(),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Привіт, ${user.name}.',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const CartButton(),
                ],
              ),
            ),
            const CategoryTabBar(),
            const CategoryTabView(),
          ],
        ),
      ),
    );
  }
}
