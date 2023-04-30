import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/confirm_passwd_text_field.dart';
import 'package:hebtus_crossplatform/screens/LogIn/components/sign_in_button.dart';
import '../../../components/or_divider.dart';
import '../../../components/password_text_field.dart';
import '../../../components/email_text_field.dart';
import '../../../services/auth_service.dart';
import 'already_have_account_btn.dart';
import '../../../components/socialmedia_icon.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../models/user.dart';
import 'dart:async';

///Sign up form, contains signup text fields: email, password, confirm password, first name, last name.
class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  static final _formKey = GlobalKey<FormState>();

  @override
  State<SignupForm> createState() => _SignupFormState();
}

GoogleSignIn googleSignIn = GoogleSignIn(
  clientId:
      "1076195175237-9b8nk3mlnn8m6sijeuivebd5tjq8r1pq.apps.googleusercontent.com",
);

class _SignupFormState extends State<SignupForm> {
  //function that handles sign in logic for login with google
  Future _handleSignIn() async {
    try {
      var account = await googleSignIn.signIn();
      var googleKey = await account?.authentication;
      var idToken = googleKey?.idToken;
      callBEGoogle(idToken!);
      print(account);
    } catch (error) {
      print(error);
    }
  }

  //this function makes an instant of authentication services and calls the backend with the idToken
  Future callBEGoogle(String idToken) async {
    bool isCaught = false;
    final AuthService authService = AuthService();
    setState(() {
      _isLoading = true;
    });
    try {
      User user = await authService.googleLogin(idToken);
    } catch (e) {
      isCaught = true;
      setState(() {
        _isLoading = false;
      });
      debugPrint(e.toString());
      // ignore: use_build_context_synchronously
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: Text(e.toString()),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          });
    } finally {
      if (isCaught == false) {
        context.go("/home");
      }
    }
  }

  final _passwdController = TextEditingController();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _confirmPassController = TextEditingController();
  bool _isLoading = false;

  GoogleSignInAccount? _currentUser;
  StreamSubscription<GoogleSignInAccount?>? _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      _currentUser = account;
      if (_currentUser != null) {
        var googleKey = await account?.authentication;
        var idToken = googleKey?.idToken;
        callBEGoogle(idToken!);
      }
    });
    googleSignIn.signInSilently();
    googleSignIn.signOut();
    //googleSignIn.disconnect();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: SignupForm._formKey,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
              ))
            : Column(
                children: [
                  EmailTextField(
                    myKey: "signupEmailField",
                    controller: _emailController,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextFormField(
                              controller: _firstNameController,
                              key: const Key("firstNameField"),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (firstName) {
                                if (firstName != null && firstName.isEmpty) {
                                  return "First Name can't be empty";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  label: Text("First name"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: TextFormField(
                              controller: _lastNameController,
                              key: const Key("lastNameField"),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (lastName) {
                                if (lastName != null && lastName.isEmpty) {
                                  return "Last Name can't be empty";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  label: Text("Last name"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
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
                    controller: _confirmPassController,
                    myKey: "signupConfirmField",
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        key: const Key("SignUp"),
                        onPressed: () async {
                          bool isCaught = false;
                          String message = "";
                          if (SignupForm._formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final AuthService authService = AuthService();
                              message = await authService.signup(
                                  _firstNameController.text,
                                  _lastNameController.text,
                                  _emailController.text,
                                  _passwdController.text,
                                  _confirmPassController.text);
                              debugPrint(message);
                            } catch (e) {
                              isCaught = true;
                              setState(() {
                                _isLoading = false;
                              });
                              debugPrint(e.toString());
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Error"),
                                      content: Text(e.toString()),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  });
                            } finally {
                              if (isCaught == false) {
                                if (message != "login") {
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              const Text("Welcome to Hebtus!"),
                                          content: const Text(
                                              "Thank you for signing up, please verify your address by clicking on the link we sent to your email."),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                return context.go("/");
                                              },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        );
                                      });
                                } else {
                                  context.go("/home");
                                }
                              }
                            }
                          }
                        },
                        child: const Text("Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                  ),
                  const OrDivider(),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaIcon(
                            iconSource: "assets/icons/facebook.svg",
                            press: () async {}),
                        const SizedBox(width: 15),
                        buildSignInButton(
                          onPressed: _handleSignIn,
                        ),
                      ],
                    ),
                  ),
                  const AlreadyRegisteredBtn(),
                ],
              ));
  }
}
