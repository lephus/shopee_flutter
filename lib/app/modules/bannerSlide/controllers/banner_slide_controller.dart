import 'package:get/get.dart';
import 'package:shoseshop/app/modules/bannerSlide/providers/slide_model_provider.dart';
import 'package:shoseshop/app/modules/bannerSlide/slide_model_model.dart';

class BannerSlideController extends GetxController {
  //TODO: Implement BannerSlideController
  List<SlideModel> imgList = [];
  @override
  void onInit() {
    print('123');
    getSlide();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getSlide(){
    SlideModelProvider().getSlide().then((value){
      imgList = value as List<SlideModel>;
    });
  }
}
