import 'package:flutter/material.dart';
import 'package:restaurant/features/auth/presentation/views/hello_screen.dart';
import 'package:restaurant/features/auth/presentation/views/otp_screen.dart';
import 'package:restaurant/features/auth/presentation/views/phone_screen.dart';
import 'package:restaurant/features/auth/presentation/views/registration_screen.dart';
import 'package:restaurant/features/cart/presentation/views/cart_screen.dart';
import 'package:restaurant/features/cart/presentation/views/map_screen.dart';
import 'package:restaurant/features/cart/presentation/views/order_screen.dart';
import 'package:restaurant/features/cart/presentation/views/order_success_screen.dart';
import 'package:restaurant/features/menu/presentation/views/main_screen.dart';
import 'package:restaurant/features/auth/presentation/views/profile_screen.dart';
import 'package:restaurant/utils/custom_page_route.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PhoneScreen.routeName:
      return CustomPageRoute(
        child: PhoneScreen(),
        settings: settings,
      );
    case OTPScreen.routeName:
      return CustomPageRoute(
        child: const OTPScreen(),
        settings: settings,
      );
    case RegistrationScreen.routeName:
      return CustomPageRoute(
        child: const RegistrationScreen(),
        settings: settings,
      );
    case MainScreen.routeName:
      return CustomPageRoute(
        child: const MainScreen(),
        settings: settings,
        axisDirection: AxisDirection.up,
      );
    case ProfileScreen.routeName:
      return CustomPageRoute(
        child: const ProfileScreen(),
        settings: settings,
      );
    case CartScreen.routeName:
      return CustomPageRoute(
        child: const CartScreen(),
        settings: settings,
        axisDirection: AxisDirection.up,
      );
    case MapScreen.routeName:
      return CustomPageRoute(
        child: const MapScreen(),
        settings: settings,
      );
    case OrderScreen.routeName:
      return CustomPageRoute(
        child: const OrderScreen(),
        settings: settings,
      );
    case OrderSuccessScreen.routeName:
      return CustomPageRoute(
        child: const OrderSuccessScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const HelloScreen(),
        settings: settings,
      );
  }
}
