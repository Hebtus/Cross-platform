import 'dart:convert';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:hebtus_crossplatform/models/user.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

///class that contains all the authentication services and functions that make api calls
class AuthService {
  Future<User> login(String email, String password) async {
    Uri url = Uri.parse('$urlString/api/v1/login');
    //the data sent
    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
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

      CurrentUser currentUser = CurrentUser();
      currentUser.setToken(token);
      //setting current user data
      User user = User.fromJson(userData);
      currentUser.setUser(user);
      return user;
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<String> signup(String firstName, String lastName, String email,
      String password, String confirmPassword) async {
    Uri url = Uri.parse("$urlString/api/v1/signup");
    final Map<String, dynamic> signupData = {
      "name": {"firstName": firstName, "lastName": lastName},
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    };
    final Map<String, String> signupHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response;
    try {
      response = await http.post(url,
          body: jsonEncode(signupData), headers: signupHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    // http.Response response = await http.get(url, headers: signupHeaders);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map signUpResponse = jsonDecode(response.body);
      String message = signUpResponse["message"];
      return message;
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<String> forgotPassword(String email) async {
    Uri url = Uri.parse("$urlString/api/v1/forgotpassword");
    final Map<String, dynamic> forgotPassData = {"email": email};
    final Map<String, String> forgotPassHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response;
    try {
      response = await http.post(url,
          body: jsonEncode(forgotPassData), headers: forgotPassHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map forgotPassResponse = jsonDecode(response.body);
      String message = forgotPassResponse["message"];
      return message;
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<String> googleLogin() async {
    Uri url = Uri.parse("$urlString/api/v1/oauth/login/google");
    final Map<String, String> googleLoginHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response;
    try {
      response = await http.get(url, headers: googleLoginHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return "sucess";
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<String> facebookLogin() async {
    Uri url = Uri.parse("$urlString/api/v1/oauth/login/facebook");
    final Map<String, String> facebookLoginHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };

    http.Response response;
    try {
      response = await http.get(url, headers: facebookLoginHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return "success";
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  Future<String> logout() async {
    Uri url = Uri.parse("$urlString/api/v1/logout");
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> logoutHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };

    //logoutHeaders['cookie'] = currentUser.getToken();

    http.Response response;
    try {
      response = await http.get(url, headers: logoutHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return "sucess";
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }
}
