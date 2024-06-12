import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/common/theme.dart';
import 'package:restaurant/features/auth/presentation/views/hello_screen.dart';
import 'package:restaurant/utils/locator.dart';
import 'package:restaurant/utils/routes.dart';
import 'package:restaurant/features/auth/presentation/bloc/auth_cubit/auth_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/registration_cubit/registration_cubit.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/cart/presentation/bloc/address_cubit/address_cubit.dart';
import 'package:restaurant/features/cart/presentation/bloc/cart_cubit/cart_cubit.dart';
import 'package:restaurant/features/cart/presentation/bloc/order_cubit/order_cubit.dart';
import 'package:restaurant/features/menu/presentation/bloc/product_cubit/product_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthCubit>()),
        BlocProvider(create: (context) => sl<RegistrationCubit>()),
        BlocProvider(create: (context) => sl<UserCubit>()),
        BlocProvider(create: (context) => sl<ProductCubit>()),
        BlocProvider(create: (context) => sl<CartCubit>()),
        BlocProvider(create: (context) => sl<AddressCubit>()),
        BlocProvider(create: (context) => sl<OrderCubit>()),
      ],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        initialRoute: HelloScreen.routeName,
        onGenerateRoute: (route) => onGenerateRoute(route),
      ),
    );
  }
}
