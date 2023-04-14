//singleton class that represents the current logged in user and holds the token
import 'models/user.dart';

class CurrentUser {
  //class data members
  late String token;
  late User currentUser;
  bool isLoggedIn = false;

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
