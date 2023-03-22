import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/or_divider.dart';
import 'package:hebtus_crossplatform/components/password_text_field.dart';
import 'package:hebtus_crossplatform/screens/LogIn/components/dont_have_account_btn.dart';
import '../../../components/socialmedia_icon.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
              decoration: const InputDecoration(
                  label: Text("Email address"),
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))))),
        ),
        PasswordTextfield(displayText: "Password"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: () {},
              child: const Text("Log In",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ),
        TextButton(
            onPressed: () {},
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
