import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../shop/controllers/shop_controller.dart';
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
  }
}
