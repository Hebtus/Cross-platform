//singleton class that represents the current logged in user and holds the token
import 'models/user.dart';

class CurrentUser {
  late String token;
  late User currentUser;
  //private constructor
  CurrentUser._();
  static final CurrentUser _instance = CurrentUser._();

  //whenever the class is called, the static variable is returned
  factory CurrentUser() {
    return _instance;
  }

  //when the user logs out, the cookie(which holds the token) is cleared
  void logout() {
    token = "";
  }

  //returns the cookie string which holds the token to be sent with requests that require the token
  String getToken() {
    return token;
  }

  //sets the value of the cookie for the current logged in user
  void setToken(String? cookie) {
    if (cookie == null) {
      token = "";
    } else {
      token = cookie;
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
}
