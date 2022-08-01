import 'package:fema_flutter/login/screen/LoginScreen.dart';
import 'package:fema_flutter/model/Preference/AppPreference.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../screen/home/HomeScreen.dart';

class PermissionHandlerScreen extends StatefulWidget {
  const PermissionHandlerScreen({Key? key}) : super(key: key);

  @override
  State<PermissionHandlerScreen> createState() =>
      _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  bool inApprove = true;

  @override
  void initState() {
    super.initState();
    permissionServiceCall();
  }

  permissionServiceCall() async {
    bool success = false;

    await permissionServices().then(
      (value) async {
        for (var entry in value.entries) {
          if (await entry.key.isGranted) {
            success = true;
          }
        }
      },
    );
    inApprove = success;
    if (success) {
      checkUser();
    } else {
      permissionServiceCall();
    }
  }

  checkUser() async {
    String user = await getPreferenceString("user");
    if (user.isEmpty) {
      moveToLogin();
    } else {
      moveToLoading();
    }
  }

  moveToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  moveToLoading() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  /*Permission services*/
  Future<Map<Permission, PermissionStatus>> permissionServices() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.location,
      Permission.storage,
      Permission.calendar,
      Permission.camera
      //add more permission to request here.
    ].request();
    bool granted = true;
    for (var entry in statuses.entries) {
      if (await entry.key.isPermanentlyDenied) {
        await openAppSettings().then(
          (value) async {
            if (value) {
              if ((await entry.key.status.isPermanentlyDenied == true &&
                  await entry.key.status.isGranted == false)) {
                // openAppSettings();
                granted =
                    false; /* opens app settings until permission is granted */
              }
            }
          },
        );
      } else {
        if (await entry.key.isDenied) {
          granted = false;
        }
      }
    }
    /*{Permission.camera: PermissionStatus.granted, Permission.storage: PermissionStatus.granted}*/
    return statuses;
  }

  _onWillPop() async {
    // This dialog will exit your app on saying yes
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    permissionServiceCall();
    return WillPopScope(
      onWillPop: () async {
        _onWillPop();
        return false;
      },
      child: Scaffold(
          body: (inApprove)
              ? Container()
              : Center(
                  child: InkWell(
                      onTap: () {
                        permissionServiceCall();
                      },
                      child: const Text(
                          "Click here to enable Enable Permission Screen")),
                )),
    );
  }
}
