import 'package:get/get.dart';

import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/phone/bindings/phone_binding.dart';
import '../modules/phone/views/phone_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/searchs/bindings/searchs_binding.dart';
import '../modules/searchs/views/searchs_view.dart';
import '../modules/tabs/bindings/tabs_binding.dart';
import '../modules/tabs/views/tabs_view.dart';
import '../modules/video/bindings/video_binding.dart';
import '../modules/video/views/video_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PHONE;

  static final routes = [
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => const CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHS,
      page: () => const SearchsView(),
      binding: SearchsBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO,
      page: () => const VideoView(),
      binding: VideoBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PHONE,
      page: () => const PhoneView(),
      binding: PhoneBinding(),
    ),
  ];
}
