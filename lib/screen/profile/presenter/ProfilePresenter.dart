import 'dart:convert';

import 'package:fema_flutter/screen/login/model/User.dart';
import 'package:fema_flutter/screen/profile/ProfileView.dart';
import 'package:fema_flutter/screen/profile/model/profile_model_entity.dart';
import 'package:fema_flutter/util/Util.dart';
import 'package:http/http.dart';

import '../../../network/Auth.dart';

class ProfilePresenter {
  getEmployee() {}
}

class BasicProfilePresenter implements ProfilePresenter {
  ProfileView view;

  BasicProfilePresenter(this.view);

  @override
  getEmployee() async {
    var user = await getUser();
    var token = user.token;
    if (token != null) {
      Auth.getEmployeeInformation(token).then((value) {
        Response response = value;
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);

          ProfileModelEntity modelEntity = ProfileModelEntity.fromJson(data[0]);
          view.showDataProfile(modelEntity);
        }
      }, onError: (error) {
        view.showDataFailed(error.toString());
      });
    }
  }
}
