import 'package:flutter/material.dart';

///The appbar with the application name and/or logo and its styling
class SignUpPagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpPagesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Hebtus",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
