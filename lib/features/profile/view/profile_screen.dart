import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/presentation/bloc/user_cubit/user_cubit.dart';
import 'package:restaurant/features/auth/presentation/views/phone_screen.dart';
import 'package:restaurant/features/auth/presentation/widgets/error_snackbar.dart';
import 'package:restaurant/common/widgets/primary_button.dart';

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
        return Center(
          child: PrimaryButton(
            onPressed: () {
              context.read<UserCubit>().logOut();
            },
            text: 'Вийти з аккаунту',
          ),
        );
      },
    );
  }
}
