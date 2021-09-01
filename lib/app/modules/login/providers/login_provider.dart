import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginProvider extends GetConnect {
  var storage = GetStorage();
  Future<bool> customerLogin(var email, var password) async{
    try{
      final data = {
        'email': email,
        'password' : password
      };
      final response = await post("http://10.0.2.2:5000/api/customer/login", data);
      if (response.status.hasError){
        return Future.error(response.statusText);
      }else{
        print(response.body);
        if (response.statusCode == 401){
          return false;
        }else{
          storage.write("token", response.body['token']);
          return true;
        }
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }
  Future<bool> customerRegister(var image, var fullName, var address, var age, var email, var password) async{
    try{
      final data = {
        'image':'http://117.3.81.221:5000/images/users/2021-08-02_091001.673760.png',
        'fullName':fullName,
        'address': address,
        'age': age,
        'email': email,
        'password' : password
      };
      final response = await post("http://10.0.2.2:5000/api/customer/register", data);
      if (response.status.hasError){
        return Future.error(response.statusText);
      }else{
        print(response.body);
        if (response.statusCode == 404){
          return false;
        }else{
          print(response.body);
          return true;
        }
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }
}
