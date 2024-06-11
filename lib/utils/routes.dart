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

var routes = {
          HelloScreen.routeName: (context) => const HelloScreen(),
          PhoneScreen.routeName:(context) => PhoneScreen(),
          OTPScreen.routeName: (context) => const OTPScreen(),
          RegistrationScreen.routeName: (context) => const RegistrationScreen(),
          MainScreen.routeName: (context) => const MainScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          MapScreen.routeName: (context) => const MapScreen(),
          OrderScreen.routeName: (context) => const OrderScreen(),
          OrderSuccessScreen.routeName: (context) => const OrderSuccessScreen(),
        };