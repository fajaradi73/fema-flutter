import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

void writePreferenceInt(String key, int value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setInt(key, value);
}

void writePreferenceBool(String key, bool value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setBool(key, value);
}

void writePreferenceDouble(String key, double value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setDouble(key, value);
}

void writePreferenceString(String key, String value) async {
  final SharedPreferences prefs = await _prefs;
  prefs.setString(key, value);
}

getPreferenceInt(String key) async {
  final SharedPreferences prefs = await _prefs;
  return _prefs.then((value) => prefs.getInt(key) ?? 0);
}

getPreferenceBool(String key) async {
  final SharedPreferences prefs = await _prefs;
  return _prefs.then((value) => prefs.getBool(key) ?? false);
}

getPreferenceDouble(String key) async {
  final SharedPreferences prefs = await _prefs;
  return _prefs.then((value) => prefs.getDouble(key) ?? 0.0);
}

Future<int> getTheme() async {
  return await getPreferenceInt("theme");
}

deleteUser() async{
  final SharedPreferences prefs = await _prefs;
  prefs.remove("user");
}

setTheme(color) {
  writePreferenceInt("theme", color);
}

getPreferenceString(String key) async {
  final SharedPreferences prefs = await _prefs;
  return _prefs.then((value) => prefs.getString(key) ?? "");
}
