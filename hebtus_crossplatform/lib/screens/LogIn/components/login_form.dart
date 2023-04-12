import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/or_divider.dart';
import 'package:hebtus_crossplatform/components/password_text_field.dart';
import 'package:hebtus_crossplatform/components/email_text_field.dart';
import 'package:hebtus_crossplatform/screens/LogIn/components/dont_have_account_btn.dart';
import '../../../components/socialmedia_icon.dart';
import 'package:go_router/go_router.dart';
import '../../../models/user.dart';
import '../../../services/auth_service.dart';

///The login form contains textfields for the email and password, with necessary validations
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });
  static final _formKey = GlobalKey<FormState>();

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _passwdController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: LoginForm._formKey,
        child: Column(
          children: [
            EmailTextField(
                myKey: "loginEmailField", controller: _emailController),
            PasswordTextfield(
              controller: _passwdController,
              myKey: "loginPassField",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  key: const Key("LogIn"),
                  onPressed: () async {
                    if (LoginForm._formKey.currentState!.validate()) {
                      final AuthService authService = AuthService();
                      try {
                        User user = await authService.login(
                            _emailController.text, _passwdController.text);
                        debugPrint("Successful login${user.firstName}");

                        return context.go("/home");
                      } catch (e) {
                        debugPrint(e.toString());
                      }
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
