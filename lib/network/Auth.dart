import 'dart:async';
import 'dart:convert';

import 'package:fema_flutter/util/Constant.dart';
import 'package:http/http.dart' as http;

class Auth {
  static Future login(String username, String password) {
    return http.post(Uri.parse("${Constant.baseUrl}/login"),
        headers: {
          'Authorization': '<Your token>'
        },
        body: {'username': username, 'password': password});
  }

  static Future getEmployeeInformation(String token){
    return http.get(Uri.parse("${Constant.baseUrl}/fema-personal-service/api/personal_information/getEmployeeInformation"),
    headers: {'X-Auth-Token': token});
  }
}
