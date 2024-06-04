import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/cart/presentation/bloc/address_cubit/address_cubit.dart';
import 'package:restaurant/features/cart/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/cart/presentation/widgets/order_item_list_view.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final addressState = context.read<AddressCubit>().state;
    final cartState = context.read<CartCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Підтвердження замовлення'),
        centerTitle: true,
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Адреса отримувача: ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (addressState is AddressLoaded)
                  Text(
                    '${addressState.street}, ${addressState.name}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                const SizedBox(height: 20),
                Text(
                  'У кошику:',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (cartState is CartLoaded)
                  OrderItemListView(cart: cartState.cart),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (cartState is CartLoaded)
                  Text(
                    'До сплати: ${cartState.cart.fold(0, (sum, item) => sum + item.count * item.item.price)}₴',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
