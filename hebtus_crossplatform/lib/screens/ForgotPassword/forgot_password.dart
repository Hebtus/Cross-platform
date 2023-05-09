import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/email_text_field.dart';
import 'package:hebtus_crossplatform/components/signup_pages_appbar.dart';
import 'package:hebtus_crossplatform/constants.dart' as constants;
import 'package:go_router/go_router.dart';

import '../../services/auth_service.dart';

///Forgot password, the screen contains the textfield for entering email, to send an email to the account for password resetting
class ForgotPasswdScreen extends StatefulWidget {
  const ForgotPasswdScreen({super.key});

  static final _formKey = GlobalKey<FormState>();

  @override
  State<ForgotPasswdScreen> createState() => _ForgotPasswdScreenState();
}

class _ForgotPasswdScreenState extends State<ForgotPasswdScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final TextEditingController emailController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorDark
          ])),
      child: Scaffold(
          appBar: const SignUpPagesAppBar(),
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                    ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Forgot  Your Password?",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                        ),
                        Container(
                          width: mediaQuery.size.width < constants.phoneWidth
                              ? mediaQuery.size.width * 0.9
                              : constants.phoneWidth,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                    "Enter your account email, and we'll send you a link to reset your password.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ),
                              Form(
                                key: ForgotPasswdScreen._formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: EmailTextField(
                                          myKey: "forgotPassEmailField",
                                          controller: emailController,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            bool isCaught = false;
                                            if (ForgotPasswdScreen
                                                ._formKey.currentState!
                                                .validate()) {
                                              setState(() {
                                                _isLoading = true;
                                              });
                                              try {
                                                final AuthService authService =
                                                    AuthService();
                                                String message =
                                                    await authService
                                                        .forgotPassword(
                                                            emailController
                                                                .text);
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
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title:
                                                            const Text("Error"),
                                                        content: Text(e
                                                            .toString()
                                                            .replaceAll(
                                                                RegExp(
                                                                    r'Exception: '),
                                                                '')),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              context.go("/");
                                                            },
                                                            child: const Text(
                                                                'OK'),
                                                          ),
                                                        ],
                                                      );
                                                    });
                                              } finally {
                                                if (isCaught == false) {
                                                  showDialog(
                                                      barrierDismissible: true,
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              "Password Reset"),
                                                          content: const Text(
                                                              "Check your Email for a link to reset your password"),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                                context.go("/");
                                                              },
                                                              child: const Text(
                                                                  'OK'),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                }
                                              }
                                            }
                                          },
                                          child: const Text("Send",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  onPressed: () {
                                    return context.go("/");
                                  },
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          "Back to Login Page",
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
            ),
          )),
    );
  }
}
