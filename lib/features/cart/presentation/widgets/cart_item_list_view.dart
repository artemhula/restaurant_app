import 'package:flutter/material.dart';
import 'package:restaurant/common/widgets/primary_button.dart';
import 'package:restaurant/features/cart/domain/entity/item/cart_item.dart';
import 'package:restaurant/features/cart/presentation/widgets/cart_item_divider.dart';
import 'package:restaurant/features/cart/presentation/widgets/cart_item_tile.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({
    super.key,
    required this.cart,
  });
  final List<CartItem> cart;
  @override
  Widget build(BuildContext context) {
    final total =
        cart.fold(0, (sum, item) => sum + item.count * item.item.price);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.1,
            maxHeight: MediaQuery.of(context).size.height * 0.7,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return cart.isNotEmpty
                    ? ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CartItemTile(cartItem: cart[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const CartItemDivider();
                        },
                        itemCount: cart.length,
                        shrinkWrap: true,
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Ви ще не додали товари у кошик',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ));
              },
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Text(
          'До сплати: $total₴',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.right,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(onPressed: () {}, text: 'Далі', isActive: cart.isNotEmpty),
        ),
      ],
    );
  }
}
// 