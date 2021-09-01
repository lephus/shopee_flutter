import 'package:get/get.dart';
import 'package:flutter/material.dart';
class HeaderController extends GetxController {
  //TODO: Implement HeaderController
  Color backgroundColor;
  Color backgroundColorSearch;
  double opacity;
  double offset;
  Color colorIcon;
  @override
  void onInit() {
    super.onInit();
    backgroundColor = Colors.transparent;
    backgroundColorSearch = Colors.white;
    colorIcon = Colors.white;
    opacity = 0.0;
    offset = 1.0;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
