import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/common/widgets/primary_button.dart';
import 'package:restaurant/features/cart/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/menu/domain/entity/category.dart';
import 'package:restaurant/features/menu/presentation/bloc/product_cubit/product_cubit.dart';
import 'package:restaurant/features/menu/presentation/widgets/product_card.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductCubit, ProductState>(
        bloc: context.read<ProductCubit>()..loadProducts(),
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return TabBarView(
              physics: const BouncingScrollPhysics(),
              children: Category.values.map((Category category) {
                var productsInCategory = state.products
                    .where((element) => element.category == category)
                    .toList();
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BlocBuilder<CartCubit, CartState>(
                    bloc: context.read<CartCubit>()..initCart(),
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        return GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.21 / 0.3,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 25,
                          ),
                          itemCount: productsInCategory.length,
                          itemBuilder: (context, index) {
                            return ProductCard(
                              id: productsInCategory[index].id,
                              photoUrl: productsInCategory[index].imageUrl,
                              description:
                                  productsInCategory[index].description,
                              category: productsInCategory[index].category,
                              title: productsInCategory[index].name,
                              weight: productsInCategory[index].weight,
                              price: productsInCategory[index].price,
                              isInCart: state.cart.any((element) =>
                                  element.item.id ==
                                  productsInCategory[index].id),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                );
              }).toList(),
            );
          } else if (state is ProductFailure) {
            return Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Error: ${state.message}'),
                Text('Упс.. Щось пішло не так!', style: Theme.of(context).textTheme.headlineSmall,),
                const SizedBox(height: 20),
                PrimaryButton(
                  onPressed: () {
                    context.read<ProductCubit>().loadProducts();
                  },
                  text: 'Спробувати ще раз',
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
