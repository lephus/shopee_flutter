import 'package:get/get.dart';
import 'package:shoseshop/app/modules/product/product_model.dart';
import 'package:shoseshop/app/modules/product/providers/product_provider.dart';
class ProductController extends GetxController {
  //TODO: Implement ProductController
  List<ProductModel> productViewModel = [];

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getProduct(){
    ProductProvider().getProduct().then((value){
      productViewModel = value as List<ProductModel>;
    });
  }
}
