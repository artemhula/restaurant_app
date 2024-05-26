import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/phone_screen.dart';
import 'package:restaurant/features/auth/presentation/widgets/error_snackbar.dart';
import 'package:restaurant/common/widgets/primary_button.dart';
import 'package:restaurant/features/cart/presentation/bloc/cart_cubit/cart_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserNotLoaded) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              PhoneScreen.routeName, ModalRoute.withName('/'));
        }
        if (state is UserFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context)
                .showSnackBar(getErrorSnackbar(state.message));
          });
        }
      },
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is UserLoaded) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.1,
                  child: Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.width * 0.1,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  state.user.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 15),
                Text(
                  'Стать: ${state.user.sex ? 'Чоловіча' : 'Жіноча'}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  onPressed: () {
                    context.read<UserCubit>().logOut();
                    context.read<CartCubit>().eraseCart();
                  },
                  text: 'Вийти з аккаунту',
                ),
                const SizedBox(height: 15),
                Text(state.user.uid,
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
