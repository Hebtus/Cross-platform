import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/confirm_passwd_text_field.dart';
import '../../../components/password_text_field.dart';

class ForgotPasswdForm extends StatefulWidget {
  const ForgotPasswdForm({
    super.key,
  });

  static final _formKey = GlobalKey<FormState>();

  @override
  State<ForgotPasswdForm> createState() => _ForgotPasswdFormState();
}

class _ForgotPasswdFormState extends State<ForgotPasswdForm> {
  final _passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: ForgotPasswdForm._formKey,
        child: Column(
          children: [
            PasswordTextfield(
              controller: _passwdController,
              myKey: "resetPassPasswordField",
            ),
            ConfirmPasswordTextfield(
              passwdController: _passwdController,
              myKey: "resetPassConfirmField",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (ForgotPasswdForm._formKey.currentState!.validate()) {
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
