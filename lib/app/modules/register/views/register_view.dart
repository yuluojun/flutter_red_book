import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/screenUtils.dart';
import 'package:study/app/common/tool/is_empty.dart';
import 'package:study/app/common/tool/toast.dart';
import 'package:study/app/common/widget/confirm_button.dart';
import 'package:study/app/common/widget/logo.dart';
import 'package:study/app/common/widget/name_text_field.dart';
import 'package:study/app/common/widget/pwd_text_field.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

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
              onPressed: () {},
              child: Text("登录",
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtils.fontSize(16))))
        ],
      ),
      body: ListView(
        children: [
          Logo(),
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
          PwdTextField(
              hint: "请再次输入密码",
              onChanged: (value) {},
              textEditingController: controller.confirmPasswordController),
          ConfirmButton(
              text: "注册",
              onPressed: () async {
                _register(context);
              }),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtils.height(10),
                left: ScreenUtils.width(30),
                right: ScreenUtils.width(30)),
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [Text("注册即代表同意《用户协议》和《隐私政策》")],
            ),
          )
        ],
      ),
    );
  }

  _register(context) async {
    if (isEmpty(controller.userNameController.text)) {
      Toast.getToast(context, "请输入用户名");
      return;
    }
    if (isEmpty(controller.passwordController.text)) {
      Toast.getToast(context, "请输入密码");
      return;
    }

    if (isEmpty(controller.confirmPasswordController.text)) {
      Toast.getToast(context, "请再次输入密码");
      return;
    }

    if (controller.passwordController.text !=
        controller.confirmPasswordController.text) {
      Toast.getToast(context, "两次密码不一致");
      return;
    }

    if (controller.passwordController.text.length < 6 ||
        controller.confirmPasswordController.text.length < 6) {
      Toast.getToast(context, "密码长度不能小于6位");
      return;
    }
    await controller.register(context);
  }
}
