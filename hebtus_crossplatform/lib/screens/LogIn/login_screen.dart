import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/signup_pages_appbar.dart';
import 'package:hebtus_crossplatform/constants.dart' as constants;
import 'package:hebtus_crossplatform/services/auth_service.dart';
import 'components/login_form.dart';

///The screen contains the login form and logic
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/liquid-cheese.png"),
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
                    child: Text("Log in",
                        key: Key("LogInTitle"),
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
                    child: const LoginForm(),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
