import 'package:flutter/material.dart';

class CartItemDivider extends StatelessWidget {
  const CartItemDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.tertiary.withAlpha(50),
    );
  }
}
