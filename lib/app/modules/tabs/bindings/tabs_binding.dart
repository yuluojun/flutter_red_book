import 'package:get/get.dart';
import 'package:study/app/modules/tabbar/basketball/controllers/basketball_controller.dart';
import 'package:study/app/modules/tabbar/feel/controllers/feel_controller.dart';
import 'package:study/app/modules/tabbar/funny/controllers/funny_controller.dart';
import 'package:study/app/modules/tabbar/school/controllers/school_controller.dart';

import '../../shop/controllers/shop_controller.dart';
import '../../tabbar/home/controllers/home_controller.dart';
import '../../user/controllers/user_controller.dart';
import '../../videoLibrary/controllers/video_library_controller.dart';
import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<VideoLibraryController>(
          () => VideoLibraryController(),
    );
    Get.lazyPut<ShopController>(
          () => ShopController(),
    );
    Get.lazyPut<UserController>(
          () => UserController(),
    );
    Get.lazyPut<SchoolController>(
          () => SchoolController(),
    );
    Get.lazyPut<BasketballController>(
          () => BasketballController(),
    );
    Get.lazyPut<FeelController>(
          () => FeelController(),
    );
    Get.lazyPut<FunnyController>(
          () => FunnyController(),
    );
  }
}
