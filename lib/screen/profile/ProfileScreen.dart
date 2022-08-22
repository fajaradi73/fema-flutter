import 'package:dotted_border/dotted_border.dart';
import 'package:fema_flutter/model/Preference/AppPreference.dart';
import 'package:fema_flutter/screen/login/view/LoginScreen.dart';
import 'package:fema_flutter/screen/profile/ProfileView.dart';
import 'package:fema_flutter/screen/profile/model/profile_model_entity.dart';
import 'package:fema_flutter/screen/profile/presenter/ProfilePresenter.dart';
import 'package:fema_flutter/screen/theme/ThemeScreen.dart';
import 'package:fema_flutter/util/Constant.dart';
import 'package:fema_flutter/widget/LoadingDialog.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> implements ProfileView {
  var themeColor = const Color.fromRGBO(232, 239, 244, 100).value;

  late ProfilePresenter presenter;

  var isLoading = true;

  ProfileModelEntity profileModelEntity = ProfileModelEntity();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter = BasicProfilePresenter(this);
    setThemeColor();

    presenter.getEmployee();
  }

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
      body: LoadingDialog(
        inAsyncCall: isLoading,
        opacity: 0.5,
        progressIndicator: const Center(
          child: CircularProgressIndicator(),
        ),
        child: bodyWidget(),
      ),
    );
  }

  @override
  void setThemeColor() async {
    int theme = await getTheme();
    if (theme != 0) {
      themeColor = theme;
      setState(() {});
    }
  }

  @override
  moveToTheme() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ThemeScreen()));
    if (!mounted) return;

    if (result != null) {
      setState(() {
        setThemeColor();
      });
    }
  }

  @override
  logoOut() {
    deleteUser();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  bodyWidget() {
    return Container(
      decoration: BoxDecoration(color: Color(themeColor)),
      child: Column(
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
                alignment: Alignment.center,
                child: const Image(image: AssetImage("assets/icons/ic_pick_image.png"),),
              ),
            ),
          ),
          Container(
            height: 90,
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: setImageProfile(profileModelEntity))),
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
                    child: Text(profileModelEntity.peopleType ??
                        profileModelEntity.npk ??
                        ""),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(profileModelEntity.fullName ?? ""),
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
                    image: AssetImage("assets/icons/ic_right_arrow.png"),
                    height: 15,
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                moveToTheme();
              },
              child: const Text(
                "Change Theme",
                style: TextStyle(color: Colors.blue),
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
                onPressed: () {
                  logoOut();
                },
                child: const Text("Log Out")),
          )
        ],
      ),
    );
  }

  @override
  showDataProfile(ProfileModelEntity modelEntity) {
    isLoading = false;
    profileModelEntity = modelEntity;
    print(modelEntity);
    setState(() {});
  }

  @override
  showDataFailed(String error) {
    isLoading = false;
    setState(() {});
  }

  @override
  setImageProfile(ProfileModelEntity modelEntity) {
    var path = modelEntity.photoFilePath;
    if (modelEntity.peopleType != null && path == null) {
      return const AssetImage("assets/images/profile_non_npk.png");
    } else if (path != null) {
      return NetworkImage(Constant.baseUrl + path);
    } else {
      return const AssetImage("assets/images/profile_non_npk.png");
    }
  }
}
