import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductProvider extends GetConnect {
  var storage = GetStorage();
  Future<bool> getProduct() async{
    try{
      final response = await get(
          "http://10.0.2.2:5000/api/product/get-all",
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer '+storage.read('token'),
          } );
      if (response.status.hasError){
        return Future.error(response.statusText);
      }else{
        print(response.body);
        if (response.statusCode != 200){
          return false;
        }else{
          print(response.body);
          return response.body;
        }
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }
}
