import 'package:get/get.dart';

import 'package:shoseshop/app/modules/bannerSlide/bindings/banner_slide_binding.dart';
import 'package:shoseshop/app/modules/bannerSlide/views/banner_slide_view.dart';
import 'package:shoseshop/app/modules/header/bindings/header_binding.dart';
import 'package:shoseshop/app/modules/header/views/header_view.dart';
import 'package:shoseshop/app/modules/home/bindings/home_binding.dart';
import 'package:shoseshop/app/modules/home/views/home_view.dart';
import 'package:shoseshop/app/modules/login/bindings/login_binding.dart';
import 'package:shoseshop/app/modules/login/views/login_view.dart';
import 'package:shoseshop/app/modules/mainMenu/bindings/main_menu_binding.dart';
import 'package:shoseshop/app/modules/mainMenu/views/main_menu_view.dart';
import 'package:shoseshop/app/modules/product/bindings/product_binding.dart';
import 'package:shoseshop/app/modules/product/views/product_view.dart';
import 'package:shoseshop/app/modules/story/bindings/story_binding.dart';
import 'package:shoseshop/app/modules/story/views/story_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HEADER,
      page: () => HeaderView(),
      binding: HeaderBinding(),
    ),
    GetPage(
      name: _Paths.BANNER_SLIDE,
      page: () => BannerSlideView(),
      binding: BannerSlideBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_MENU,
      page: () => MainMenuView(),
      binding: MainMenuBinding(),
    ),
    GetPage(
      name: _Paths.STORY,
      page: () => StoryView(),
      binding: StoryBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => ProductView(),
      binding: ProductBinding(),
    ),
  ];
}
