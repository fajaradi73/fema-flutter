import 'dart:async';

import 'package:flutter/material.dart';

import '../widget/PermissionHandlerScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PermissionHandlerScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill)),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 180,
            margin: const EdgeInsets.only(top: 70),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo_horizontal.png"),
                    fit: BoxFit.fill)),
          ),
          Container(
            height: 80,
            width: 260,
            margin: const EdgeInsets.only(top: 70),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/name.png"),
                    fit: BoxFit.fill)),
          ),
        ],
      ),
    );
  }
}
