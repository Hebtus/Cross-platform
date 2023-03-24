import 'package:flutter/material.dart';

class ConfirmPasswordTextfield extends StatefulWidget {
  final TextEditingController passwdController;
  const ConfirmPasswordTextfield({
    super.key,
    required this.passwdController,
  });

  @override
  State<ConfirmPasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<ConfirmPasswordTextfield> {
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: !_passwordVisible,
          validator: (value) {
            if (value != null && value != widget.passwdController.text) {
              return "Password doesn't match";
            }
            return null;
          },
          decoration: InputDecoration(
              label: const Text("Confirm Password"),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))))),
    );
  }
}
