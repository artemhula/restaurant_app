import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.id,
    required this.photoUrl,
    required this.title,
    required this.weight,
    required this.price,
  });
  final int id;
  final String photoUrl;
  final String title;
  final int weight;
  final int price;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isInCart = false;

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
          Image.asset(
            'assets/philadelphia.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.12,
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
                        setState(() {
                          isInCart = !isInCart;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isInCart ? Theme.of(context).colorScheme.tertiary: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(15)),
                        child:  Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: Icon(isInCart ? Icons.check_rounded : Icons.shopping_cart_outlined),
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
