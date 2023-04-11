import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'dart:convert';
import 'package:hebtus_crossplatform/models/user.dart';

import '../constants.dart';

//create a singleton class DioClient, in order for the cookies to be managed in one cookie jar and
//for the requests to be done using the same dio object
class DioClient {
  //class data members
  //dio object
  late Dio dio;
  late CookieJar cookieJar;

  //private constructor
  DioClient._() {
    dio = Dio();
    cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
  }
  static final DioClient _instance = DioClient._();

  //whenever the class is called, the static variable is returned
  factory DioClient() {
    return _instance;
  }

  //AUTHENTICATION SERVICES
  Future<User> login(String email, String password) async {
    const url = '$urlString/api/v1/login';
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

    Response response = await dio.post(url,
        data: jsonEncode(loginData), options: Options(headers: loginHeaders));

    print(cookieJar.loadForRequest(Uri.parse(url)));

    if (response.statusCode == 200 || response.statusCode == 201) {
      Map userDataResponse = jsonDecode(response.data);
      dynamic userData = userDataResponse["data"];
      return User.fromJson(userData);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
