import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoseshop/app/modules/bannerSlide/controllers/banner_slide_controller.dart';
import 'package:shoseshop/app/modules/bannerSlide/views/banner_slide_view.dart';
import 'package:shoseshop/app/modules/header/controllers/header_controller.dart';
import 'package:shoseshop/app/modules/header/views/header_view.dart';
import 'package:shoseshop/app/modules/mainMenu/controllers/main_menu_controller.dart';
import 'package:shoseshop/app/modules/mainMenu/views/main_menu_view.dart';
import 'package:shoseshop/app/modules/product/controllers/product_controller.dart';
import 'package:shoseshop/app/modules/product/views/product_view.dart';
import 'package:shoseshop/app/modules/story/controllers/story_controller.dart';
import 'package:shoseshop/app/modules/story/views/story_view.dart';
import '../controllers/home_controller.dart';

final double height = Get.height;
final double width = Get.width;
class HomeView extends GetView<HomeController> {

 final headerController = Get.put(HeaderController());
 final bannerSlideController = Get.put(BannerSlideController());
 final mainMenuController = Get.put(MainMenuController());
 final storyController = Get.put(StoryController());
 final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          HeaderView()
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            BannerSlideView(),
            SizedBox(height: 10.0,),
            MainMenuView(),
            StoryView(),
            ProductView()
          ],
        )
      ),
    );
  }
}