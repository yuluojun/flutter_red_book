import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/searchs_controller.dart';

class SearchsView extends GetView<SearchsController> {
  const SearchsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
