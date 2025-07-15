import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/funny_controller.dart';

class FunnyView extends GetView<FunnyController> {
  const FunnyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FunnyView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FunnyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
