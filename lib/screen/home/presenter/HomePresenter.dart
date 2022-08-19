// ignore_for_file: file_names

import 'package:fema_flutter/screen/home/model/HomeModel.dart';
import 'package:fema_flutter/screen/home/view/HomeView.dart';

class HomePresenter {
  getMenu(bool isTrue) {}
}

class BasicHomePresenter implements HomePresenter {
  HomeView view;
  HomeModel model = HomeModel();

  BasicHomePresenter(this.view);

  @override
  getMenu(bool isTrue) {
    if (isTrue) {
      return model.getMenu;
    } else {
      return model.getIcon;
    }
  }
}
