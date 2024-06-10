import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/common/widgets/primary_button.dart';
import 'package:restaurant/features/auth/data/models/user.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/auth/presentation/widgets/error_snackbar.dart';
import 'package:restaurant/features/cart/data/models/order.dart';
import 'package:restaurant/features/cart/presentation/bloc/address_cubit/address_cubit.dart';
import 'package:restaurant/features/cart/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/cart/presentation/bloc/order_cubit/order_cubit.dart';
import 'package:restaurant/features/cart/presentation/views/order_success_screen.dart';
import 'package:restaurant/features/cart/presentation/widgets/order_item_list_view.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const routeName = '/order';

  @override
  Widget build(BuildContext context) {
    final addressState = context.read<AddressCubit>().state;
    final cartState = context.read<CartCubit>().state;
    final userState = context.read<UserCubit>().state;

    OrderModel? getOrder() {
      if (userState is UserLoaded &&
          cartState is CartLoaded &&
          addressState is AddressLoaded) {
        return OrderModel(
            user: userState.user as UserModel,
            cart: cartState.cart,
            address: addressState.city);
      }
      return null;
    }

    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        if (state is OrderFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(getErrorSnackbar('Неможливо замовити!'));
        } else if (state is OrderSuccess && userState is UserLoaded) {
          context.read<CartCubit>().eraseCart();
          Navigator.pushNamedAndRemoveUntil(
            context,
            OrderSuccessScreen.routeName,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is OrderLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Підтвердження замовлення'),
            centerTitle: true,
          ),
          body: Padding(
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
          bottomNavigationBar: BottomAppBar(
            color: Theme.of(context).colorScheme.background,
            child: PrimaryButton(
                onPressed: () {
                  final order = getOrder();
                  if (order != null) {
                    context.read<OrderCubit>().sendOrder(order);
                  }
                },
                text: 'Замовити'),
          ),
        );
      },
    );
  }
}
