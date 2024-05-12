import 'package:flutter/material.dart';
import 'package:restaurant/features/menu/presentation/views/arguments/main_screen_arguments.dart';
import 'package:restaurant/features/menu/presentation/widgets/category_tab_bar.dart';
import 'package:restaurant/features/menu/presentation/widgets/category_tab_view.dart';
import 'package:restaurant/features/profile/view/profile_screen.dart';
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
          title: const Text('cafe'),
          actions: [
            //profile button
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.person),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // hello text
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Привіт, ${user.name}.',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
            ),

            //tabbar
            const CategoryTabBar(),

            //tabbar views
            const CategoryTabView(),
          ],
        ),
      ),
    );
  }
}
