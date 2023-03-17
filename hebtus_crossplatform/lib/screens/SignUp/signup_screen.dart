import 'package:flutter/material.dart';

import 'components/already_have_account_btn.dart';
import 'components/socialmedia_icon.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          appBar: AppBar(
            title: const Text(
              "Hebtus",
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
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
                        style: TextStyle(fontSize: 50, color: Colors.white)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Form(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  label: Text("Email address"),
                                  prefixIcon: Icon(Icons.mail),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        label: Text("First name"),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                              ),
                              SizedBox(width: 5),
                              Flexible(
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        label: Text("Last name"),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  label: Text("Password"),
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {},
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  label: Text("Confirm password"),
                                  prefixIcon: Icon(Icons.lock),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye_outlined),
                                    onPressed: () {},
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5))))),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text("Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SocialMediaIcon(
                                  iconSource: "assets/icons/facebook.svg",
                                  press: () {}),
                              const SizedBox(width: 15),
                              SocialMediaIcon(
                                  iconSource: "assets/icons/google.svg",
                                  press: () {}),
                            ],
                          ),
                        ),
                        const AlreadyRegisteredBtn(),
                      ],
                    )),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
