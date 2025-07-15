import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feel_controller.dart';

class FeelView extends GetView<FeelController> {
  const FeelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeelView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FeelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
