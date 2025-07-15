import 'package:flutter/material.dart';

import '../service/screenUtils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading {
  static progressIndicator() {
    return SizedBox(
      height: ScreenUtils.height(300),
      child: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      ),
    );
  }

  static loading() {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.blue,
        size: 30,
      ),
    );
  }

  static loadingText(msg) {
    return Center(
      child: Text(msg),
    );
  }
}
