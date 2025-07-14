import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtils {
  static width(num s) {
    return s.w;
  }

  static height(num s) {
    return s.h;
  }

  static fontSize(num s) {
    return s.sp;
  }

  // 设备宽度
  static screenWidth() {
    return 1.sw;
  }

  // 设备高度
  static screenHeight() {
    return 1.sh;
  }

}
