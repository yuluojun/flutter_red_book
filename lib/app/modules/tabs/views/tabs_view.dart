import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/iconFonts.dart';

import '../../../common/service/screenUtils.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(), //禁止页面左右滑动切换
          controller: controller.pageController,
          children: controller.pageList,
        ),
        floatingActionButton: Container(
          height: 40,
          width: 50,
          margin: const EdgeInsets.only(top: 54),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),

          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: SizedBox(
              child: BottomNavigationBar(
                iconSize: 24,
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.blue,
                currentIndex: controller.currentIndex.value,
                selectedFontSize: ScreenUtils.fontSize(12),
                unselectedFontSize: ScreenUtils.fontSize(12),
                onTap: (index) {
                  controller.setCurrentIndex(index);
                  controller.pageController.jumpToPage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(IconFonts.shouye), label: '首页'),
                  BottomNavigationBarItem(
                      icon: Icon(IconFonts.meitiku), label: '媒体库'),
                  BottomNavigationBarItem(
                      icon: Icon(IconFonts.loading), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(IconFonts.gouwu), label: '购物'),
                  BottomNavigationBarItem(
                      icon: Icon(IconFonts.wode), label: '我的')
                ],
              ),
            ))));
  }
}
