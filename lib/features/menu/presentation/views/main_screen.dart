import 'package:flutter/material.dart';
import 'package:restaurant/features/auth/domain/entity/user.dart';
import 'package:restaurant/features/menu/presentation/widgets/category_tab_bar.dart';
import 'package:restaurant/features/menu/presentation/widgets/category_tab_view.dart';
import 'package:restaurant/utils/tabs.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
          return DefaultTabController(
            length: tabs.length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('cafe'),
                actions: const [
                  //profile button
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.person),
                  ),
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // hello text
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Привіт, ${user.name}.',
                      style: Theme.of(context).textTheme.headlineLarge,
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

