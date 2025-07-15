import 'package:flutter/material.dart';
import 'package:study/app/common/service/screenUtils.dart';

class ConfirmButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ConfirmButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtils.height(30),),
      height: ScreenUtils.height(44),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.blue,
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ScreenUtils.height(30))))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: ScreenUtils.fontSize(18)),
        ),
      ),
    );
  }
}
