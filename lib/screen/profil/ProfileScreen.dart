import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Transform(
              transform: Matrix4.translationValues(-25, 0, 0),
              child: const Text(
                "Personal Information",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            child: DottedBorder(
              dashPattern: const [8, 4],
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
              borderType: BorderType.Rect,
              child: Container(
                height: 160,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            height: 90,
            width: 90,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/profile_non_npk.png"))),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("1052"),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: const Text("Fajar Adi Prasetyo"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black))),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Image(
                      image: AssetImage("assets/icons/ic_general_info.png")),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text("Employee General Information"))
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black))),
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Image(
                      image: AssetImage("assets/icons/ic_facility.png")),
                  Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text("Public Facility")),
                  const Spacer(),
                  const Image(
                      image: AssetImage("assets/icons/ic_right_arrow.png"),height: 15,width: 15,),
                ],
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(8),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                onPressed: () {},
                child: const Text("Log Out")),
          )
        ],
      ),
    );
  }
}
