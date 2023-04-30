//singleton class that represents the current logged in user and holds the token
import 'models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class CurrentUser {
  //class data members
  late String token;
  late User currentUser;
  bool isLoggedIn = false;
  GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "1076195175237-9b8nk3mlnn8m6sijeuivebd5tjq8r1pq.apps.googleusercontent.com",
  );

  //private constructor
  CurrentUser._() {
    currentUser = User(
        userID: "",
        firstName: "",
        lastName: "",
        email: "",
        locationName: "",
        coordinates: List.empty());
  }
  static final CurrentUser _instance = CurrentUser._();

  //whenever the class is called, the static variable is returned
  factory CurrentUser() {
    return _instance;
  }

  //when the user logs out, the cookie(which holds the token) is cleared
  void logout() {
    token = "";
    isLoggedIn = false;
    //in case the sign in was through google
    googleSignIn.signOut();
    //in case the sign in was through facebook
    if (!FacebookAuth.instance.isWebSdkInitialized) {
      FacebookAuth.instance.webAndDesktopInitialize(
          appId: "180177551591717",
          cookie: true,
          xfbml: true,
          version: "v13.0");
    }

    FacebookAuth.instance.logOut();
  }

  //returns the token string to be sent with requests that require the token
  String getToken() {
    return token;
  }

  //sets the value of the cookie for the current logged in user
  void setToken(String? cookie) {
    if (cookie == null) {
      token = "";
    } else {
      token = cookie;
      isLoggedIn = true;
    }
  }

  //sets the info of the current user to be that of the user upon login
  void setUser(User user) {
    currentUser.coordinates = user.coordinates;
    currentUser.email = user.email;
    currentUser.firstName = user.firstName;
    currentUser.lastName = user.lastName;
    currentUser.locationName = user.locationName;
    currentUser.userID = user.userID;
  }

  //returns the logged in user's email
  String getuseremail() {
    return currentUser.email;
  }
}
