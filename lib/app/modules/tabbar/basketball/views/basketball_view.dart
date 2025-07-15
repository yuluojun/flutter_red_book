import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/basketball_controller.dart';

class BasketballView extends GetView<BasketballController> {
  const BasketballView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketballView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BasketballView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
