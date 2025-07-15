import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:study/app/common/constant/constants.dart';
import 'package:study/app/common/service/httpsApis.dart';
import 'package:study/app/common/tool/shared_preference.dart';
import 'package:study/app/common/tool/toast.dart';

class PhoneController extends GetxController {
  TextEditingController telController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  HttpsApis httpsApis = HttpsApis();
  RxBool isSendCode = false.obs;
  RxInt seconds = 10.obs;

  //倒计时的方法
  countDown() {
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds.value--;
      if (seconds.value == 0) {
        isSendCode.value = false;
        timer.cancel();
      }
      update();
    });
  }

//  发送验证码Api接口：
//  https://p.flutterschool.cn/api/code/sendCode/
//  验证验证码Api接口：
//  https://p.flutterschool.cn/api/code/checkCode/

  sendCode(context) async {
    var apiUrl = "api/code/sendCode/";
    var params = {"phone": telController.text};
    var response = await httpsApis.post(apiUrl, data: params);
    if (response != null) {
      isSendCode.value = true;
      Toast.getToast(context, "验证码发送成功");
      countDown();
    } else {
      Toast.getToast(context, "验证码发送失败");
    }
  }

  doLogin(context) async {
    var apiUrl = "api/code/checkCode/";
    var params = {"phone": telController.text, "code": codeController.text};
    var response = await httpsApis.post(apiUrl, data: params);
    if (response != null) {
      if (json.decode(response.data)["success"] == 1) {
        Toast.getToast(context, "登录成功");
        SharedPreference.saveString(Constants.USER_NAME, telController.text);
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed("/tabs");
        });
      } else {
        Toast.getToast(context, "登录失败");
      }
    } else {
      Toast.getToast(context, "登录失败");
    }
  }
}
