import 'dart:convert';
import 'package:hebtus_crossplatform/models/user.dart';
import 'package:http/http.dart' as http;

const String urlString = "https://009c-156-222-154-84.eu.ngrok.io";

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

    // http.Response response = await http.post(url,
    //     body: jsonEncode(loginData), headers: loginHeaders);
    http.Response response = await http.get(
        Uri.parse(
            "https://009c-156-222-154-84.eu.ngrok.io/api/v1/events/2231/sales/"),
        headers: loginHeaders);
    print(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
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
    print(jsonEncode(signupData));
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
    http.Response response =
        await http.post(url, body: jsonEncode(forgotPassData));
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map forgotPassResponse = jsonDecode(response.body);
      String message = forgotPassResponse["message"];
      return message;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
