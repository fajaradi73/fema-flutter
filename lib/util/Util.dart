
import 'dart:convert';

import 'package:fema_flutter/model/Preference/AppPreference.dart';

import '../login/model/User.dart';

getUser() async {
  String user = await getPreferenceString("user");
  var data = jsonDecode(user);
  return User.fromJson(data);
}