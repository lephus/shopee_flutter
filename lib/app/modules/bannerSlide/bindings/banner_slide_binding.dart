import 'package:get/get.dart';

import '../controllers/banner_slide_controller.dart';

class BannerSlideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BannerSlideController>(
      () => BannerSlideController(),
    );
  }
}
