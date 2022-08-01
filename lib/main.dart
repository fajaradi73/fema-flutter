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
          primaryColor: Colors.purpleAccent.shade400,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(28, 117, 188, 100),
            secondary: Colors.purpleAccent.shade700,
          )),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
