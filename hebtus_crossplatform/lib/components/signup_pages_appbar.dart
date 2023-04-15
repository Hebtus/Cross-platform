import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///The appbar with the application name and/or logo and its styling
class SignUpPagesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SignUpPagesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          context.go("/home");
        },
        child: const Text(
          "Hebtus",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
