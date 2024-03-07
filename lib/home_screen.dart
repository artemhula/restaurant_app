import 'package:flutter/material.dart';
import 'package:restaurant/barcode_screen.dart';
import 'package:restaurant/history_screen.dart';
import 'package:restaurant/main_screen.dart';
import 'package:restaurant/menu_screen.dart';
import 'package:restaurant/other_screen.dart';

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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        children: _screens,
      ),
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

  List<Widget> _screens = [
    MainScreen(),
    MenuScreen(),
    BarcodeScreen(),
    HistoryScreen(),
    OtherScreen(),
  ];
}
