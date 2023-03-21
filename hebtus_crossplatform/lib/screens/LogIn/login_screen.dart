import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/signup_pages_appbar.dart';
import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          appBar: SignUpPagesAppBar(),
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
                        style: TextStyle(fontSize: 50, color: Colors.white)),
                  ),
                  Container(
                    width: mediaQuery.size.width < 450
                        ? mediaQuery.size.width * 0.9
                        : 450,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: LoginForm(),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
