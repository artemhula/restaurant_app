import 'package:flutter/material.dart';
import 'package:restaurant/features/menu/presentation/widgets/product.dart';

const tabs = [
  Tab(child: Text('Роли')),
  Tab(child: Text('Сети')),
  Tab(child: Text('Унагі')),
  Tab(child: Text('Вок')),
  Tab(child: Text('Напої')),
  Tab(child: Text('Сети')),
];

final views = [
  GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.24 / 0.3,
      crossAxisSpacing: 25,
      mainAxisSpacing: 25,
    ),
    
    itemBuilder: (context, index) => const Product(
      id: 1,
      photoUrl: '',
      title: 'Філадельфія з огірком',
      weight: 240,
      price: 259,
    ),
  ),
  Container(child: Text('hello3')),
  Container(child: Text('hello4')),
  Container(child: Text('hello5')),
  Container(child: Text('hello6')),
];
