import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_library_controller.dart';

class VideoLibraryView extends GetView<VideoLibraryController> {
  const VideoLibraryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoLibraryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VideoLibraryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
