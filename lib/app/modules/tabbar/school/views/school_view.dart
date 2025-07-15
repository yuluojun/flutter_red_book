import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/school_controller.dart';

class SchoolView extends GetView<SchoolController> {
  const SchoolView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SchoolView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SchoolView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
