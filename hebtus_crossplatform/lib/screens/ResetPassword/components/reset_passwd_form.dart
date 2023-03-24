import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/confirm_passwd_text_field.dart';
import '../../../components/password_text_field.dart';

class ForgotPasswdForm extends StatelessWidget {
  ForgotPasswdForm({
    super.key,
  });

  final _passwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            PasswordTextfield(controller: _passwdController),
            ConfirmPasswordTextfield(passwdController: _passwdController),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      return context.go("/");
                    }
                  },
                  child: const Text("Reset Password",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
          ],
        ));
  }
}
