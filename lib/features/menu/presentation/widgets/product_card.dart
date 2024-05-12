import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/cart/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/menu/data/models/product.dart';
import 'package:restaurant/features/menu/domain/entity/category.dart';
import 'package:restaurant/utils/url.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.id,
    required this.photoUrl,
    required this.title,
    required this.weight,
    required this.price,
    required this.category,
    required this.description,
    required this.isInCart,
  });
  final int id;
  final String photoUrl;
  final String title;
  final int weight;
  final int price;
  final Category category;
  final String description;
  final bool isInCart;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: '$url${widget.photoUrl}',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.16,
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.011,
              right: MediaQuery.of(context).size.height * 0.012,
              top: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Text(
                      '${widget.weight}г.',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        '${widget.price} ₴',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CartCubit>().toggleProductInCart(
                              ProductModel(
                                id: widget.id,
                                name: widget.title,
                                category: widget.category,
                                price: widget.price,
                                weight: widget.weight,
                                description: widget.description,
                                imageUrl: widget.photoUrl,
                              ),
                            );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: widget.isInCart
                                ? Theme.of(context).colorScheme.tertiary
                                : Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child:
                              Icon(widget.isInCart ? Icons.check_rounded : Icons.add),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
