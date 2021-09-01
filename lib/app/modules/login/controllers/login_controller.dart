import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoseshop/app/modules/login/providers/login_provider.dart';

class LoginController extends GetxController {
  TextEditingController emailTextEditController = new TextEditingController();
  TextEditingController passwordTextEditController = new TextEditingController();
  TextEditingController fullNameTextEditController = new TextEditingController();
  TextEditingController addressTextEditController = new TextEditingController();
  TextEditingController ageTextEditController = new TextEditingController();
  TextEditingController confirmPasswordTextEditController = new TextEditingController();
  var isLoading = false.obs;
  var storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    print(storage.read('tocken') );
    if(storage.read('tocken') != null && storage.read('token') != ""){
      Get.offNamed("/home");
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void actionRegister(var image, var fullName, var address, var age, var email, var password, var confirmPassword){
    if(password!=confirmPassword){
      showSnackBar("Xác nhận mật khẩu sai.", 'Vui lòng kiểm tra lại mật khẩu!', Colors.red[400]);
    }else{
      LoginProvider().customerRegister(image, fullName, address, age, email, password).then((value){
        showSnackBar("Đăng ký thành công", 'Tạo tài khoản thành công', Colors.green );
        isLoading(false);
      }, onError: (error){
        showSnackBar("Đăng ký thất bại", 'Thông tin đăng ký không hợp lệ!', Colors.red );
        isLoading(false);
      });
    }
  }

  void actionLogin(String email, String password) async {
    isLoading(true);
    if (email == "" || password ==""){
      showSnackBar("Thiếu thông tin đăng nhập", 'Vui lòng điên đầy đủ thông tin email và mật khẩu!', Colors.red[400]);
      isLoading(false);
    }else{
      LoginProvider().customerLogin(email, password).then((value){
        print(value);
        if(value == true){
          Get.offNamed("/home");
          showSnackBar("Đăng nhập thành công", '', Colors.green);
          isLoading(false);
        }else{
          isLoading(false);
          showSnackBar("Đăng nhập thất bại", 'Thông tin đăng nhập không chính xác!', Colors.red );
        }
      }, onError: (error){
        showSnackBar("Đăng nhập thất bại", 'Thông tin đăng nhập không chính xác!', Colors.red );
        isLoading(false);
      });
    }
  }
  showSnackBar(String title, String message, Color backgroudColor){
    Get.snackbar(
        title,
        message,
        duration: Duration(milliseconds: 1500),
        backgroundColor: Colors.white70,
        snackPosition: SnackPosition.TOP ,
        colorText: backgroudColor
    );
  }
  void clearTextEditingControllers() {
    emailTextEditController.clear();
    passwordTextEditController.clear();
    fullNameTextEditController.clear();
    addressTextEditController.clear();
    ageTextEditController.clear();
    confirmPasswordTextEditController.clear();
  }
}
