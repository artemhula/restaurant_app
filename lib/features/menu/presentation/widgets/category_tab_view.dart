import 'package:flutter/material.dart';
import 'package:restaurant/utils/tabs.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: TabBarView(children: views),
      ),
    );
  }
}
