import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/or_divider.dart';
import 'package:hebtus_crossplatform/components/password_text_field.dart';
import 'package:hebtus_crossplatform/components/email_text_field.dart';
import 'package:hebtus_crossplatform/screens/LogIn/components/dont_have_account_btn.dart';
import 'package:hebtus_crossplatform/screens/LogIn/components/sign_in_button.dart';
import '../../../components/socialmedia_icon.dart';
import 'package:go_router/go_router.dart';
import '../../../models/user.dart';
import '../../../services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'dart:async';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

///The login form contains textfields for the email and password, with necessary validations
class LoginForm extends StatefulWidget {
  LoginForm({super.key});
  static final _formKey = GlobalKey<FormState>();

  @override
  State<LoginForm> createState() => _LoginFormState();
}

GoogleSignIn googleSignIn = GoogleSignIn(
  clientId:
      "1076195175237-9b8nk3mlnn8m6sijeuivebd5tjq8r1pq.apps.googleusercontent.com",
);

class _LoginFormState extends State<LoginForm> {
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
              content:
                  Text(e.toString().replaceAll(RegExp(r'Exception: '), '')),
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
  GoogleSignInUserData? _userData; // sign-in information?
  //GSIButtonConfiguration? _buttonConfiguration;

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
        key: LoginForm._formKey,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
              ))
            : Column(
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
                          bool isCaught = false;
                          if (LoginForm._formKey.currentState!.validate()) {
                            setState(() {
                              _isLoading = true;
                            });
                            final AuthService authService = AuthService();
                            try {
                              User user = await authService.login(
                                  _emailController.text,
                                  _passwdController.text);
                              debugPrint("Successful login${user.firstName}");
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
                                      content: Text(e.toString().replaceAll(
                                          RegExp(r'Exception: '), '')),
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
                        },
                        child: const Text("Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
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
                          iconSource: "assets/icons/facebook.svg",
                          press: () async {
                            if (!FacebookAuth.instance.isWebSdkInitialized) {
                              await FacebookAuth.instance
                                  .webAndDesktopInitialize(
                                      appId: "180177551591717",
                                      cookie: true,
                                      xfbml: true,
                                      version: "v13.0");
                            }
                            final LoginResult result =
                                await FacebookAuth.instance.login();
                            print(result.accessToken!.token);
                            final AuthService authService = AuthService();
                            final userData =
                                await FacebookAuth.instance.getUserData();
                            bool isCaught = false;

                            try {
                              User user = await authService.facebookLogin(
                                  result.accessToken!.token, userData["email"]);
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
                                      content: Text(e.toString().replaceAll(
                                          RegExp(r'Exception: '), '')),
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
                          },
                        ),
                        const SizedBox(width: 15),
                        //plugin.renderButton(),
                        buildSignInButton(
                          onPressed: _handleSignIn,
                        ),
                      ],
                    ),
                  ),
                  const RegisterNowBtn(),
                ],
              ));
  }
}
