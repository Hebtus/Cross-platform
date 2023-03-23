import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/email_text_field.dart';
import 'package:hebtus_crossplatform/components/signup_pages_appbar.dart';
import 'package:hebtus_crossplatform/constants.dart' as constants;
import 'package:go_router/go_router.dart';

class ForgotPasswdScreen extends StatelessWidget {
  ForgotPasswdScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Forgot  Your Password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, color: Colors.white)),
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black)),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: EmailTextField()),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        return context.go("/");
                                      }
                                    },
                                    child: const Text("Send",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
