import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/or_divider.dart';
import 'package:hebtus_crossplatform/components/password_text_field.dart';
import 'package:hebtus_crossplatform/components/email_text_field.dart';
import 'package:hebtus_crossplatform/screens/LogIn/components/dont_have_account_btn.dart';
import '../../../components/socialmedia_icon.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatelessWidget {
  LoginForm({
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
            const EmailTextField(),
            PasswordTextfield(controller: _passwdController),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      return context.go("/home");
                    }
                  },
                  child: const Text("Log In",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            TextButton(
                onPressed: () {
                  return context.go("/forgotpassword");
                },
                child: const Text("Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            const OrDivider(),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaIcon(
                      iconSource: "assets/icons/facebook.svg", press: () {}),
                  const SizedBox(width: 15),
                  SocialMediaIcon(
                      iconSource: "assets/icons/google.svg", press: () {}),
                ],
              ),
            ),
            const RegisterNowBtn(),
          ],
        ));
  }
}
