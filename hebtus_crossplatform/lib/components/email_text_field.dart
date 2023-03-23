import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) {
            if (email != null && email.isEmpty) {
              return "Email field can't be empty.";
            } else if (email != null && EmailValidator.validate(email)) {
              return null;
            } else {
              return "Enter a valid email";
            }
          },
          decoration: const InputDecoration(
              label: Text("Email address"),
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))))),
    );
  }
}
