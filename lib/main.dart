import 'package:fema_flutter/screen/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(30, 120, 180, 30),
            secondary: const Color.fromRGBO(30, 120, 180, 30),
          )),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
