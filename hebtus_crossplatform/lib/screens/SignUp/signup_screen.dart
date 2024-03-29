import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/constants.dart' as constants;

import '../../components/signup_pages_appbar.dart';
import 'components/signup_form.dart';

///The screen contains the signup form and signup logic
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/sun-tornado.png"),
            fit: BoxFit.cover),
      ),
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
                    child: Text("Sign Up",
                        key: Key("SignUpTitle"),
                        style: TextStyle(fontSize: 50, color: Colors.white)),
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
                    child: const SignupForm(),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
