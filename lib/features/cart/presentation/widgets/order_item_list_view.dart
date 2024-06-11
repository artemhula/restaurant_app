import 'package:flutter/material.dart';
import 'package:restaurant/features/cart/domain/entity/cart_item.dart';

class OrderItemListView extends StatelessWidget {
  const OrderItemListView({
    super.key,
    required this.cart,
  });

  final List<CartItem> cart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        cart.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  cart[index].item.name,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'x ${cart[index].count}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    '${cart[index].item.price * cart[index].count}₴',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
