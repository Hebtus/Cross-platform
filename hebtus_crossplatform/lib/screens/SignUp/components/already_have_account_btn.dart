import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyRegisteredBtn extends StatelessWidget {
  const AlreadyRegisteredBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        return context.go("/");
      },
      child: RichText(
        text: const TextSpan(
          text: 'Already have an account? ',
          style: TextStyle(color: Colors.black),
          children: <TextSpan>[
            TextSpan(
                text: 'Log in.', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
