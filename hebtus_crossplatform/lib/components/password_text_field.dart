import 'package:flutter/material.dart';

class PasswordTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String myKey;
  const PasswordTextfield({
    super.key,
    required this.controller,
    required this.myKey,
  });

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
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
          key: Key(widget.myKey),
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (password) {
            if (password != null && password.isEmpty) {
              return "Password field can't be empty";
            }
            return null;
          },
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
              label: const Text("Password"),
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
