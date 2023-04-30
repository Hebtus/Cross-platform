import 'package:flutter/material.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class googlePage extends StatefulWidget {
  const googlePage({super.key});

  @override
  State<googlePage> createState() => _googlePageState();
}

class _googlePageState extends State<googlePage> {
  GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "1076195175237-9b8nk3mlnn8m6sijeuivebd5tjq8r1pq.apps.googleusercontent.com",
    // scopes: [
    //   'openid',
    //   'https://www.googleapis.com/auth/userinfo.profile',
    // ],
  );
  // Future<void> signinWithGoogle() async {
  //   const GOOGLE_CLIENT_DEV_KEY =
  //       '1076195175237-9b8nk3mlnn8m6sijeuivebd5tjq8r1pq.apps.googleusercontent.com';
  //   final GoogleSignIn _googleSignIn = new GoogleSignIn(
  //     clientId: GOOGLE_CLIENT_DEV_KEY,
  //     scopes: [
  //       //'https://www.googleapis.com/auth/userinfo.email',
  //       'openid',
  //       //'https://www.googleapis.com/auth/userinfo.profile',
  //     ],
  //   );
  //   try {
  //     final googleUserAccount = await _googleSignIn.signIn();
  //     final googleAuth = await googleUserAccount?.authentication;
  //     if (googleAuth != null) {
  //       print("id token ");
  //       print(googleAuth.idToken);
  //       //print(googleAuth.accessToken);

  //       // CALL YOUR BACKEND API HERE WITH idToken in the payload
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    print("here");
    googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  //await googleSignIn.signOut();
                  //await signinWithGoogle();

                  var account = await googleSignIn.signIn();

                  //var account = await googleSignIn.signIn();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Username"),
                        content:
                            Text(account != null ? account.displayName! : ""),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Perform some action when the user presses the button
                              Navigator.of(context).pop();
                            },
                            child: Text("ok"),
                          ),
                        ],
                      );
                    },
                  );
                  var googleKey = await account?.authentication;
                  var idToken = googleKey?.idToken;
                  var response = loginGoogle(idToken!);
                  // print(account);
                  // print(idToken);
                } catch (e) {
                  print(e);
                }
              },
              child: Text("sign in with google"),
            ),
            ElevatedButton(
              onPressed: () async {
                // if (!FacebookAuth.instance.isWebSdkInitialized) {
                //   await FacebookAuth.instance.webAndDesktopInitialize(
                //       appId: "180177551591717",
                //       cookie: true,
                //       xfbml: true,
                //       version: "v13.0");
                // }
                // final LoginResult result = await FacebookAuth.instance.login();
                // print(result.accessToken!.token);
                // final UserData = await FacebookAuth.instance.getUserData();
                // var message = await loginFacebook(
                //     result.accessToken!.token, UserData["email"]);
                // // ignore: use_build_context_synchronously
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: message == "success"
                //           ? Text("Username")
                //           : Text("fail"),
                //       content: Text(UserData["name"]),
                //       actions: [
                //         TextButton(
                //           onPressed: () {
                //             // Perform some action when the user presses the button
                //             Navigator.of(context).pop();
                //           },
                //           child: Text("ok"),
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
              child: Text("sign in with facebook"),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> loginGoogle(String idToken) async {
  Uri url = Uri.parse('https://hebtus.me/api/v1/oauth/login/google');
  //the data sent
  final Map<String, dynamic> loginData = {'tokenId': idToken};
  //headers sent
  final Map<String, String> loginHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'ngrok-skip-browser-warning': '1',
  };

  http.Response response;
  try {
    response = await http.post(url,
        body: jsonEncode(loginData), headers: loginHeaders);
  } catch (e) {
    throw ("Something Went Wrong, Please Try Again Later");
  }

  if (response.statusCode >= 200 && response.statusCode < 300) {
    Map userDataResponse = jsonDecode(response.body);
    dynamic userData = userDataResponse["data"];
    //setting the current user token
    //var cookies = response.headers['set-cookie'];
    var token = userDataResponse["token"];
    print(token);
    return "success";
  } else {
    throw Exception(jsonDecode(response.body)["message"]);
  }
}

Future<String> loginFacebook(String idToken, String email) async {
  http.Response FBresponse;
  try {
    FBresponse = await http.get(Uri.parse(
        "https://graph.facebook.com/oauth/access_token?client_id=180177551591717&client_secret=f88a0c39201ba6b49e2181d934c6ac99&grant_type=client_credentials"));
  } catch (e) {
    throw ("Something Went Wrong, Please Try Again Later");
  }
  Map userDataResponse = jsonDecode(FBresponse.body);
  String appToken = userDataResponse["access_token"];

  // http.Response response2;
  // try {
  //   response2 = await http.get(Uri.parse(
  //       "https://graph.facebook.com/debug_token?input_token=$idToken&access_token=${userDataResponse["access_token"]}"));
  // } catch (e) {
  //   throw ("Something Went Wrong, Please Try Again Later");
  // }
  Uri url = Uri.parse('https://hebtus.me/api/v1/oauth/login/facebook');
  //the data sent
  final Map<String, dynamic> loginData = {
    'idToken': idToken,
    "accessToken": appToken,
    "email": email
  };
  //headers sent
  final Map<String, String> loginHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'ngrok-skip-browser-warning': '1',
  };
  http.Response response;
  try {
    response = await http.post(url,
        body: jsonEncode(loginData), headers: loginHeaders);
  } catch (e) {
    throw ("Something Went Wrong, Please Try Again Later");
  }

  if (response.statusCode >= 200 && response.statusCode < 300) {
    Map userDataResponse = jsonDecode(response.body);
    dynamic userData = userDataResponse["data"];
    //setting the current user token
    //var cookies = response.headers['set-cookie'];
    var token = userDataResponse["token"];
    print(token);
    return "success";
  } else {
    //throw Exception(jsonDecode(response.body)["message"]);
    return "error";
  }
}
