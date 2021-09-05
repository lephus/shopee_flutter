import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onClickBottomNavigationBar(var index){
    selectedIndex.value = index;
  }
}
