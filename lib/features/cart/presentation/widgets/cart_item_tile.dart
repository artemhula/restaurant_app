import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/cart/domain/entity/cart_item.dart';
import 'package:restaurant/features/cart/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:restaurant/utils/url.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
  });
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: '$url${cartItem.item.imageUrl}',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.item.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context
                                  .read<CartCubit>()
                                  .toggleProductInCart(cartItem.item);
                            },
                            customBorder: const CircleBorder(),
                            child: const Icon(
                              Icons.delete,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 15),
                          InkWell(
                            onTap: cartItem.count == 1
                                ? null
                                : () {
                                    context
                                        .read<CartCubit>()
                                        .decrementProductInCart(
                                            cartItem.item);
                                  },
                            customBorder: const CircleBorder(),
                            enableFeedback: cartItem.count > 1,
                            child: Icon(
                              Icons.remove_rounded,
                              color: cartItem.count == 1 ? Colors.grey.shade800 : null,
                            ),
                          ),
                          Text(
                            '  ${cartItem.count}  ',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          InkWell(
                            onTap: () {
                              context
                                  .read<CartCubit>()
                                  .incrementProductInCart(cartItem.item);
                            },
                            customBorder: const CircleBorder(),
                            child: const Icon(
                              Icons.add_rounded,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '${cartItem.count * cartItem.item.price}₴',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
