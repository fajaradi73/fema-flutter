// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart';

import 'package:fema_flutter/screen/login/model/User.dart';
import '../../../model/Preference/AppPreference.dart';
import '../../../network/Auth.dart';
import 'package:fema_flutter/screen/login/view/LoginView.dart';

class LoginPresenter {
  void doLogin(String username, String password) {}
  void saveUser(user){}
}

class BasicLoginPresenter implements LoginPresenter {
  LoginView view;

  BasicLoginPresenter(this.view);

  @override
  void doLogin(String username, String password) {
    Auth.login(username, password).then((response) {
      Response value = response;
      if(value.statusCode == 200){
        var data = jsonDecode(response.body);
        User user = User.fromJson(data);
        view.successLogin(user);
      }else{
        view.failedLogin(value.body);
      }
    }, onError: (error) {
      view.failedLogin(error);
    });
  }

  @override
  void saveUser(user) {
    String json = jsonEncode(user);
    writePreferenceString("user", json);
  }
}
