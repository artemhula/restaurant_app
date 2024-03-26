import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/views/barcode_screen.dart';
import 'package:restaurant/views/history_screen.dart';
import 'package:restaurant/views/main_screen.dart';
import 'package:restaurant/views/menu_screen.dart';
import 'package:restaurant/views/other_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserLoaded) {
          final List<Widget> screens = [
            MainScreen(user: state.user),
            const MenuScreen(),
            const BarcodeScreen(),
            const HistoryScreen(),
            const OtherScreen(),
          ];
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton.large(
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
                _pageController.jumpToPage(2);
              },
              child: Icon(_icons[2]),
            ),
            bottomNavigationBar: BottomAppBar(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTabIcon(0),
                      _buildTabIcon(1),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTabIcon(3),
                      _buildTabIcon(4),
                    ],
                  ),
                ),
              ],
            )),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: screens,
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

  _buildTabIcon(int index) {
    return IconButton(
      icon: Icon(
        _icons[index],
        size: 26,
      ),
      color: index == _currentIndex
          ? Theme.of(context).colorScheme.primary
          : Theme.of(context).colorScheme.tertiary,
      onPressed: () {
        setState(() {
          _currentIndex = index;
        });
        _pageController.jumpToPage(index);
      },
    );
  }

  List<IconData> _icons = [
    Icons.home_filled,
    Icons.menu_book_rounded,
    Icons.qr_code_rounded,
    Icons.history_rounded,
    Icons.person_outline_sharp,
  ];
}
