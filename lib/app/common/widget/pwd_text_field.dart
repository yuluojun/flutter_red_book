import 'package:flutter/material.dart';
import 'package:study/app/common/service/screenUtils.dart';

class PwdTextField extends StatelessWidget {
  final String hint;
  final TextInputType? inputType;
  final void Function(String)? onChanged;
  final TextEditingController? textEditingController;

  const PwdTextField(
      {super.key,
      required this.hint,
      this.inputType = TextInputType.number,
      this.onChanged,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtils.height(44),
      margin: EdgeInsets.only(
          top: ScreenUtils.height(16)),
      padding: EdgeInsets.only(left: ScreenUtils.width(10)),
      decoration: BoxDecoration(
          color: const Color.fromARGB(31, 186, 186, 186),
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        cursorColor: Colors.blue, //光标颜色
        controller: textEditingController,
        obscureText: true,
        style: TextStyle(fontSize: ScreenUtils.fontSize(15)),
        keyboardType: inputType,
        //默认弹出数字键盘
        decoration: InputDecoration(
          hintText: hint, border: InputBorder.none, //去掉下划线
          prefixIcon: const Icon(Icons.lock, size: 20,),
          contentPadding:
              EdgeInsets.symmetric(vertical: ScreenUtils.height(12)),
        ),
        onChanged: onChanged,
      ),
    );
    ;
  }
}
