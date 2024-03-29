import 'package:flutter/material.dart';
import 'package:restaurant/utils/tabs.dart';

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: tabs
          .map(
            (tab) => Container(
              height: MediaQuery.of(context).size.height * 0.04,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: tab,
            ),
          )
          .toList(),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      labelColor: Colors.white,
      dividerHeight: 0,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
