import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:study/app/common/service/iconFonts.dart';
import 'package:study/app/common/service/screenUtils.dart';
import 'package:study/app/common/tool/is_empty.dart';
import 'package:study/app/common/tool/toast.dart';
import 'package:study/app/common/widget/confirm_button.dart';
import 'package:study/app/common/widget/logo.dart';

import '../controllers/phone_controller.dart';

class PhoneView extends GetView<PhoneController> {
  const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text("帮助",
                  style: TextStyle(color: Colors.black, fontSize: 16)))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenUtils.width(20)),
        children: [
          const Logo(),
          TextField(
            controller: controller.telController,
            cursorColor: Colors.blue,
            //光标颜色
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  /*边角*/
                  borderRadius: BorderRadius.all(
                    Radius.circular(40), //边角为5
                  ),
                  borderSide: BorderSide(
                    color: Colors.white, //边线颜色为白色
                    width: 1,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white, //边框颜色为白色
                    width: 1, //宽度为5
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40), //边角为30
                  ),
                ),
                filled: true,
                fillColor: const Color.fromARGB(31, 121, 120, 120),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                prefixIcon: const Padding(
                  padding: EdgeInsetsDirectional.only(start: 20, end: 10),
                  child: Icon(IconFonts.shouji),
                ),
                hintText: "请输入手机号码",
                hintStyle: const TextStyle(fontSize: 15, color: Colors.black26),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                )),
          ), //边线宽度为2
          SizedBox(height: ScreenUtils.height(20)),
          Stack(
            children: [
              TextField(
                controller: controller.codeController,
                cursorColor: Colors.blue, //光标颜色
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    /*边角*/
                    borderRadius: BorderRadius.all(
                      Radius.circular(40), //边角为40
                    ),
                    borderSide: BorderSide(
                      color: Colors.white, //边线颜色为白色
                      width: 1, //边线宽度为1
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white, //边框颜色为白色
                      width: 1, //宽度为1
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40), //边角为30
                    ),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(31, 121, 120, 120),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                  prefixIcon: const Padding(
                    padding: EdgeInsetsDirectional.only(start: 10),
                    child: Icon(
                      IconFonts.yanzhengma,color: Colors.black,size: 20,
                    ), //
                  ),
                  hintText: "请输入短信验证码",
                  hintStyle: TextStyle(
                      fontSize: ScreenUtils.fontSize(15),
                      color: Colors.black26),
                ),
              ),
              Positioned(
                  right: 20,
                  top: 15,
                  child: Obx(() => InkWell(
                        onTap: () async {
                          _getCode(context);
                        },
                        child: controller.isSendCode.value
                            ? Text(
                                "${controller.seconds.value}s后重新发送}",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenUtils.fontSize(14)),
                              )
                            : Text(
                                "获取验证码",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: ScreenUtils.fontSize(14)),
                              ),
                      )))
            ],
          ),
          ConfirmButton(
              text: "验证并登录",
              onPressed: () async {
                _login(context);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Get.toNamed("/register");
                  },
                  child: Text(
                    "新用户注册",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtils.fontSize(14)),
                  )),
              TextButton(
                  onPressed: () {},
                  child: Text("账号密码登录",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtils.fontSize(14))))
            ],
          )
        ],
      ),
    );
  }

  void _getCode(context) async {
    if (controller.isSendCode.value) {
      return;
    }

    if (isEmpty(controller.telController.text)) {
      Toast.getToast(context, "请输入手机号码");
      return;
    }

    if (controller.telController.text.length != 11 ||
        !GetUtils.isPhoneNumber(controller.telController.text)) {
      Toast.getToast(context, "请输入正确的手机号码");
      return;
    }

    await controller.sendCode(context);
  }

  void _login(context) async {
    if (isEmpty(controller.telController.text)) {
      Toast.getToast(context, "请输入手机号码");
      return;
    }

    if (controller.telController.text.length != 11 ||
        !GetUtils.isPhoneNumber(controller.telController.text)) {
      Toast.getToast(context, "请输入正确的手机号码");
      return;
    }

    if (isEmpty(controller.codeController.text)) {
      Toast.getToast(context, "请输入验证码");
      return;
    }

    if (controller.codeController.text.length != 6) {
      Toast.getToast(context, "请输入正确的验证码");
      return;
    }
    await controller.doLogin(context);
  }
}
