import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/app/common/constant/constants.dart';
import 'package:study/app/common/tool/shared_preference.dart';
import 'package:study/app/modules/user/views/user_view.dart';

import '../../shop/views/shop_view.dart';
import '../../videoLibrary/views/video_library_view.dart';
import '../views/tabBar_view.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pageList = [
    TabBars(),
    VideoLibraryView(),
    Text(''),
    ShopView(),
    UserView()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }

  Future<bool> isUserLogin() async {
    var userName = await SharedPreference.getString(Constants.USER_NAME);
    if (userName == null || userName == "") {
      return false;
    } else {
      return true;
    }
  }
}
