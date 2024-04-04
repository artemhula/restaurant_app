import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: MediaQuery.of(context).size.width * 0.38,
      height: MediaQuery.of(context).size.height * 0.24,
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
          ),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.011,
                right: MediaQuery.of(context).size.height * 0.01,
                top: MediaQuery.of(context).size.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Філадельфія',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Text(
                  '250г.',
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.pink.withOpacity(0.8),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary,
                        ),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {},
                      child: Icon(Icons.shopping_cart_outlined),
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
