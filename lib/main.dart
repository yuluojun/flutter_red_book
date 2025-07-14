import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    // flutter 屏幕适配方案，用于调整屏幕和字体大小的flutter插件，
    // 让你的UI在不同尺寸的屏幕上都能显示合理的布局!
    ScreenUtilInit(
      designSize: const Size(360, 690),  //填入设计稿中设备的屏幕尺寸,单位dp
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}
