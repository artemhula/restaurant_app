import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/menu/presentation/widgets/category_tab_bar.dart';
import 'package:restaurant/features/menu/presentation/widgets/category_tab_view.dart';
import 'package:restaurant/utils/tabs.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserLoaded) {
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
                      'Привіт, ${state.user.name}.',
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
        if (state is UserFailure) {
          return Center(
            child: Text(state.message),
          );
        }
        return Container();
      },
    );
  }
}

