import 'package:flutter/material.dart';
import 'package:restaurant/features/profile/view/profile_screen.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProfileScreen.routeName);
      },
      child: const Padding(
        padding: EdgeInsets.only(right: 15),
        child: Icon(Icons.person),
      ),
    );
  }
}
