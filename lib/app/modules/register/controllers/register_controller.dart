import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study/app/common/constant/constants.dart';
import 'package:study/app/common/service/httpsApis.dart';
import 'package:study/app/common/tool/generate_md5.dart';
import 'package:study/app/common/tool/shared_preference.dart';
import 'package:study/app/common/tool/toast.dart';

class RegisterController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  HttpsApis httpsApis = HttpsApis();

  // 生成随机字符串
  Random rnd = Random();
  final chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  getRandom(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          rnd.nextInt(chars.length),
        ),
      ),
    );
  }

  register(context) async {
    //https://p.flutterschool.cn/api/register/add/
    var apiUrl = "api/register/add/";
    var salt = getRandom(10);
    var pwd = GenerateMD5.generateMD5(
        GenerateMD5.generateMD5(passwordController.text) +
            salt +
            GenerateMD5.generateMD5(passwordController.text));
    var params = {
      "username": userNameController.text,
      "password": pwd,
      "salt": salt,
    };
    var response = await httpsApis.post(apiUrl, data: params);
    if (response != null) {
      print(json.decode(response.data));
      if (json.decode(response.data)["success"] == 1) {
        Toast.getToast(context, "注册成功");
        SharedPreference.saveString(
            Constants.USER_NAME, userNameController.text);
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAllNamed("/tabs");
        });
      } else {
        Toast.getToast(context, "注册失败");
      }
    }
  }
}
