import 'dart:convert';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:hebtus_crossplatform/models/user.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

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

    http.Response response = await http.post(url,
        body: jsonEncode(loginData), headers: loginHeaders);

    //setting the current user token
    var cookies = response.headers['set-cookie'];
    CurrentUser currentUser = CurrentUser();
    currentUser.setToken(cookies);

    if (response.statusCode >= 200 || response.statusCode < 300) {
      Map userDataResponse = jsonDecode(response.body);
      dynamic userData = userDataResponse["data"];
      return User.fromJson(userData);
    } else {
      throw Exception(response.statusCode);
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
    http.Response response = await http.post(url,
        body: jsonEncode(signupData), headers: signupHeaders);
    // http.Response response = await http.get(url, headers: signupHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map signUpResponse = jsonDecode(response.body);
      String message = signUpResponse["message"];
      return message;
    } else {
      throw Exception(response.statusCode);
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
    http.Response response = await http.post(url,
        body: jsonEncode(forgotPassData), headers: forgotPassHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map forgotPassResponse = jsonDecode(response.body);
      String message = forgotPassResponse["message"];
      return message;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<String> googleLogin() async {
    Uri url = Uri.parse("$urlString/api/v1/oauth/login/google");
    final Map<String, String> googleLoginHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };
    http.Response response = await http.get(url, headers: googleLoginHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return "sucess";
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<String> facebookLogin() async {
    Uri url = Uri.parse("$urlString/api/v1/oauth/login/facebook");
    final Map<String, String> facebookLoginHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
    };
    http.Response response = await http.get(url, headers: facebookLoginHeaders);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return "success";
    } else {
      throw Exception(response.statusCode);
    }
  }
}
