import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/screenUtils.dart';
import 'package:study/app/common/tool/is_empty.dart';
import 'package:study/app/common/tool/toast.dart';
import 'package:study/app/common/widget/confirm_button.dart';
import 'package:study/app/common/widget/logo.dart';
import 'package:study/app/common/widget/name_text_field.dart';
import 'package:study/app/common/widget/pwd_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
              onPressed: () {
                Get.toNamed("/phone");
              },
              child: Text("手机快速注册",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtils.fontSize(16)))),
          TextButton(
              onPressed: () {
                Get.toNamed("/register");
              },
              child: Text("普通注册",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtils.fontSize(16)))),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenUtils.width(20)),
        children: [
          const Logo(),
          NameTextField(
            hint: "请输入用户名",
            onChanged: (value) {},
            textEditingController: controller.userNameController,
          ),
          PwdTextField(
            hint: "请输入密码",
            onChanged: (value) {},
            textEditingController: controller.passwordController,
          ),
          ConfirmButton(
              text: "登录",
              onPressed: () async {
                _login(context);
              }),
        ],
      ),
    );
  }

  void _login(BuildContext context) async {
    if (isEmpty(controller.userNameController.text)) {
      Toast.getToast(context, "请输入用户名");
      return;
    }
    if (isEmpty(controller.passwordController.text)) {
      Toast.getToast(context, "请输入密码");
      return;
    }

    if (controller.passwordController.text.length < 6) {
      Toast.getToast(context, "密码长度不能小于6位");
      return;
    }
    await controller.login(context);
  }
}
