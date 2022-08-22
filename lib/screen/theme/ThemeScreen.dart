// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../model/Preference/AppPreference.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  var themeColor = const Color.fromRGBO(232, 239, 244, 100).value;

  var colorList = [
    const Color.fromRGBO(232, 239, 244, 100).value,
    const Color.fromRGBO(128, 222, 234, 100).value,
    const Color.fromRGBO(255, 204, 188, 100).value,
    const Color.fromRGBO(185, 246, 202, 100).value,
    const Color.fromRGBO(225, 190, 231, 100).value,
    const Color.fromRGBO(255, 255, 141, 100).value,
  ];

  @override
  void initState() {
    super.initState();
    setThemeColor();
  }

  void setThemeColor() async {
    int theme = await getTheme();
    if (theme != 0) {
      themeColor = theme;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, "back");
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            child: Transform(
                transform: Matrix4.translationValues(-25, 0, 0),
                child: const Text(
                  "Theme",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          color: Color(themeColor),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10),
              itemCount: colorList.length,
              itemBuilder: (context, item) {
                return InkWell(
                  onTap: () {
                    selectedColor(colorList[item]);
                  },
                  child: Container(
                    color: Color(colorList[item]),
                  ),
                );
              }),
        ),
      ),
    );
  }

  void selectedColor(int color) {
    setTheme(color);
    themeColor = color;
    setState(() {});
  }
}
