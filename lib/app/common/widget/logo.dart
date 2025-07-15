import 'package:flutter/material.dart';
import 'package:study/app/common/service/screenUtils.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: ScreenUtils.height(30)),
      child: SizedBox(
        width: ScreenUtils.width(80),
        child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
      ),
    );
  }
}
