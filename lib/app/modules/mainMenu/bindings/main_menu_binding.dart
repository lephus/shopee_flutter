import 'package:get/get.dart';

import '../controllers/main_menu_controller.dart';

class MainMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainMenuController>(
      () => MainMenuController(),
    );
  }
}
