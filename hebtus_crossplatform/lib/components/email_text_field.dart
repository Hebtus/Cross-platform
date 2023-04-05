import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

///a textfield component for entering email address, contains the necessary validations for ensuring that the entered text is a valid email
class EmailTextField extends StatefulWidget {
  final String myKey;
  final TextEditingController controller;
  const EmailTextField({
    super.key,
    required this.controller,
    required this.myKey,
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
          controller: widget.controller,
          key: Key(widget.myKey),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) {
            if (email != null && email.isEmpty) {
              return "Email field can't be empty.";
            } else if (email != null && EmailValidator.validate(email)) {
              return null;
            } else {
              return "Please Enter a valid email";
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
