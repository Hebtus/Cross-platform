import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/confirm_passwd_text_field.dart';
import '../../../components/or_divider.dart';
import '../../../components/password_text_field.dart';
import '../../../components/email_text_field.dart';
import 'already_have_account_btn.dart';
import '../../../components/socialmedia_icon.dart';
import 'package:go_router/go_router.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  static final _formKey = GlobalKey<FormState>();

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: SignupForm._formKey,
        child: Column(
          children: [
            const EmailTextField(myKey: "signupEmailField"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                        key: const Key("firstNameField"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (firstName) {
                          if (firstName != null && firstName.isEmpty) {
                            return "First Name can't be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            label: Text("First name"),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))))),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    child: TextFormField(
                        key: const Key("lastNameField"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (lastName) {
                          if (lastName != null && lastName.isEmpty) {
                            return "Last Name can't be empty";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            label: Text("Last name"),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))))),
                  ),
                ],
              ),
            ),
            PasswordTextfield(
              controller: _passwdController,
              myKey: "signupPassField",
            ),
            ConfirmPasswordTextfield(
              passwdController: _passwdController,
              myKey: "signupConfirmField",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  key: const Key("SignUp"),
                  onPressed: () {
                    if (SignupForm._formKey.currentState!.validate()) {
                      return context.go("/");
                    }
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ),
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
            const AlreadyRegisteredBtn(),
          ],
        ));
  }
}
