// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fema_flutter/screen/home/presenter/HomePresenter.dart';
import 'package:fema_flutter/screen/home/view/HomeView.dart';
import 'package:fema_flutter/screen/profile/ProfileScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late HomePresenter presenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter = BasicHomePresenter(this);
  }

  var imgList = [
    'https://images.unsplash.com/photo-1535916707207-35f97e715e1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80',
    'https://images.unsplash.com/photo-1496304841270-2cb66cf766b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    'https://images.unsplash.com/photo-1535916707207-35f97e715e1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80',
    'https://images.unsplash.com/photo-1496304841270-2cb66cf766b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
    'https://images.unsplash.com/photo-1535916707207-35f97e715e1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1548&q=80',
    'https://images.unsplash.com/photo-1496304841270-2cb66cf766b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg_empty.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: carouselSlider(),
              ),
              menu()
            ],
          ),
        ),
      ),
    );
  }

  imageSliders() {
    return imgList
        .map((item) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: [
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )))
        .toList();
  }

  carouselSlider() {
    return Column(children: [
      Expanded(
        child: CarouselSlider(
          items: imageSliders(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.black
                          : Colors.white)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }

  titleBar() {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0.0,
      leading: InkWell(
        onTap: () {},
        child: const Center(
          child: Image(
            image: AssetImage("assets/icons/ic_msg.png"),
            height: 30,
            width: 30,
            fit: BoxFit.fill,
          ),
        ),
      ),
      actions: [
        IconButton(
            onPressed: moveToProfile,
            icon: const Image(
              image: AssetImage("assets/icons/ic_user.png"),
              height: 30,
              width: 40,
              fit: BoxFit.fill,
            ))
      ],
      title: Container(
        alignment: Alignment.center,
        child: const Image(
          image: AssetImage("assets/images/logo_horizontal.png"),
          fit: BoxFit.fill,
          height: 35,
        ),
      ),
    );
  }

  menu() {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2 / 2.8),
          itemCount: presenter.getMenu(true).length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                onClick(index);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.purpleAccent.shade400,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 6.5,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(presenter.getMenu(false)[index]),
                            fit: BoxFit.scaleDown),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Text(
                    presenter.getMenu(true)[index],
                    style: const TextStyle(color: Colors.white),
                  )
                ]),
              ),
            );
          }),
    );
  }

  void onClick(int index) {}

  void moveToProfile() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()));
  }
}
