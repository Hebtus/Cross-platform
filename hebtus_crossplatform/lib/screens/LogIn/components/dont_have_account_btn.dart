import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterNowBtn extends StatelessWidget {
  const RegisterNowBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        return context.go("/signup");
      },
      child: RichText(
        text: const TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: 'Sign Up.',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
