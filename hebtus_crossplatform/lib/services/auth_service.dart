import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/current_user.dart';
import 'package:hebtus_crossplatform/models/user.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/notifications.dart';

///class that contains all the authentication services and functions that make api calls
class AuthService {
  http.Client _httpClient;

  AuthService([http.Client? httpClient])
      : _httpClient = httpClient ?? http.Client();

  ///login function, takes an email and password and returns a [User] on successful login, throws exception otherwise
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
      response = await _httpClient.post(url,
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

  ///signup function, takes information necessary for signup and returns a string that indicates success on successful signup, throws exception otherwise
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
      response = await _httpClient.post(url,
          body: jsonEncode(signupData), headers: signupHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    // http.Response response = await http.get(url, headers: signupHeaders);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map signUpResponse = jsonDecode(response.body);
      //check if the user has logged in or signed up
      if (signUpResponse.containsKey('token')) {
        dynamic userData = signUpResponse["data"];
        //setting the current user token
        var token = signUpResponse["token"];
        CurrentUser currentUser = CurrentUser();
        currentUser.setToken(token);
        //setting current user data
        User user = User.fromJson(userData);
        currentUser.setUser(user);
        return "success";
      } else {
        String message = signUpResponse["message"];
        return message;
      }
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  ///forgot password function, takes a string email and returns a success message on success, throws exception otherwise
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
      response = await _httpClient.post(url,
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

  ///function that handles the google login and signup logic, returns a [User] instance on success
  Future<User> googleLogin(String idToken) async {
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
      response = await _httpClient.post(url,
          body: jsonEncode(loginData), headers: loginHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map userDataResponse = jsonDecode(response.body);
      dynamic userData = userDataResponse["data"];
      //setting the current user token
      var token = userDataResponse["token"];
      CurrentUser currentUser = CurrentUser();
      currentUser.setToken(token);
      //setting current user data
      User user = User.fromJson(userData);
      currentUser.setUser(user);
      // print(token);
      return user;
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  ///function that handles the facebook login and signup logic, returns a [User] instance on success
  Future<User> facebookLogin(String idToken, String email) async {
    http.Response fbResponse;
    try {
      fbResponse = await _httpClient.get(Uri.parse(
          "https://graph.facebook.com/oauth/access_token?client_id=180177551591717&client_secret=f88a0c39201ba6b49e2181d934c6ac99&grant_type=client_credentials"));
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }
    Map fbResponseBody = jsonDecode(fbResponse.body);
    String appToken = fbResponseBody["access_token"];

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
      response = await _httpClient.post(url,
          body: jsonEncode(loginData), headers: loginHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map userDataResponse = jsonDecode(response.body);
      dynamic userData = userDataResponse["data"];
      //setting the current user token
      var token = userDataResponse["token"];
      CurrentUser currentUser = CurrentUser();
      currentUser.setToken(token);
      //setting current user data
      User user = User.fromJson(userData);
      currentUser.setUser(user);
      // print(token);
      return user;
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  ///logout function, logs the user out of the application and modifies the current user object accordingly
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
      response = await _httpClient.get(url, headers: logoutHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return "success";
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }

  ///function that fetches the notifications, if there are any for the [CurrentUser]
  Future<Notifications?> getNotifications() async {
    Uri url = Uri.parse("$urlString/api/v1/notifications");
    CurrentUser currentUser = CurrentUser();
    final Map<String, String> notificationHeaders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'ngrok-skip-browser-warning': '1',
      'token': currentUser.getToken(),
    };

    http.Response response;
    try {
      response = await _httpClient.get(url, headers: notificationHeaders);
    } catch (e) {
      throw ("Something Went Wrong, Please Try Again Later");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      Map responseMap = jsonDecode(response.body);
      dynamic notificationData = responseMap["data"]["notification"];
      Notifications notif = Notifications.fromJson(notificationData);

      return notif;
    } else if (response.statusCode == 404) {
      return null;
    } else {
      throw Exception(jsonDecode(response.body)["message"]);
    }
  }
}
