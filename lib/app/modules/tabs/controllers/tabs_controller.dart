import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/app/modules/user/views/user_view.dart';

import '../../home/views/home_view.dart';
import '../../shop/views/shop_view.dart';
import '../../videoLibrary/views/video_library_view.dart';

class TabsController extends GetxController {
  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  List<Widget> pageList = [
    HomeView(),
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

}
