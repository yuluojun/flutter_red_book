import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:study/app/common/service/screenUtils.dart';

class NameTextField extends StatelessWidget {
  final String hint;
  final TextInputType? inputType;
  final void Function(String)? onChanged;
  final TextEditingController? textEditingController;

  const NameTextField(
      {super.key,
      required this.hint,
      this.inputType = TextInputType.text,
      this.onChanged,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtils.height(44),
      padding: EdgeInsets.only(left: ScreenUtils.width(10)),
      decoration: BoxDecoration(
          color: const Color.fromARGB(31, 186, 186, 186),
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        cursorColor: Colors.blue, //光标颜色
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              RegExp("[a-zA-Z]|[\u4e00-\u9fa5]|[0-9]")), //只能输入汉字或者字母或数字
          LengthLimitingTextInputFormatter(20), //最大长度
          FilteringTextInputFormatter.deny(RegExp(r'\s')), //不允许使用空格的文本字段
        ],
        controller: textEditingController,
        style: TextStyle(fontSize: ScreenUtils.fontSize(15)),
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hint, border: InputBorder.none, //去掉下划线
          prefixIcon: const Icon(Icons.person),
          contentPadding: EdgeInsets.symmetric(vertical: ScreenUtils.height(12)), // 垂直内边距统一
        ),
        onChanged: onChanged,
      ),
    );
  }
}
