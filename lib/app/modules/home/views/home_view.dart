import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/service/screenUtils.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: ScreenUtils.screenWidth(),
          height: ScreenUtils.height(200),
          color: Colors.blue,
          child: Text("小红书",
              style: TextStyle(
                  fontSize: ScreenUtils.fontSize(30), color: Colors.white)),
        ),
      ),
    );
  }
}
