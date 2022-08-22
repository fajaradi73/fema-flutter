// ignore_for_file: file_names

import 'package:fema_flutter/screen/login/model/User.dart';
import 'package:fema_flutter/screen/login/presenter/LoginPresenter.dart';
import 'package:fema_flutter/screen/login/view/LoginView.dart';
import '../../home/view/HomeScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../widget/LoadingDialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginView {
  bool passwordVisible = true;
  late LoginPresenter presenter;
  var username = "";
  var password = "";
  bool isLogin = true;

  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    presenter = BasicLoginPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg_login.png"),
                    fit: BoxFit.fill)),
            child: LoadingDialog(
              inAsyncCall: !isLogin,
              opacity: 0.5,
              progressIndicator: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: 200,
                    margin: const EdgeInsets.only(top: 70),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/logo_vertical.png"),
                            fit: BoxFit.fitWidth)),
                  ),
                  bodyForm(),
                  buttonSubmit(),
                ],
              ),
            )),
      ),
    );
  }

  @override
  buttonSubmit() {
    return TextButton(
        onPressed: () {
          submitLogin();
        },
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.primary),
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }

  @override
  bodyForm() {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(40),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: userController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Enter your username",
                    border: UnderlineInputBorder(),
                    hintStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300)),
                onChanged: (value) {
                  username = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: passController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: passwordVisible,
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    border: const UnderlineInputBorder(),
                    hintStyle: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w300),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      color: Colors.black,
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                    )),
                onChanged: (value) {
                  password = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void failedLogin(error) {
    if (kDebugMode) {
      print(error);
    }
    isLogin = true;
    setState(() {
      userController.text = username;
      passController.text = password;
    });
  }

  @override
  void successLogin(User user) async {
    isLogin = true;
    presenter.saveUser(user);
    setState(() {});
  }

  @override
  void submitLogin() {
    isLogin = false;
    presenter.doLogin(username, password);
    // moveToHome();
    setState(() {});
  }

  void moveToHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
