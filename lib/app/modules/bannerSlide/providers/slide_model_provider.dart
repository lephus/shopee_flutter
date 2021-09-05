import 'package:get/get.dart';
import 'package:shoseshop/app/data/BASE_URL_API.dart';
import '../slide_model_model.dart';
class SlideModelProvider extends GetConnect {
  Future<SlideModel> getSlide() async{
    try{
      final response = await get(BASE_URL_API().SERVER+BASE_URL_API().API_SLIDE);
      if (response.status.hasError){
        return Future.error(response.statusText);
      }else{
        print(response.body);
        if (response.statusCode != 200){
          return null;
        }else{
          httpClient.defaultDecoder = (map) {
            if (map is Map<String, dynamic>) return SlideModel.fromJson(map);
            if (map is List)
              return map.map((item) => SlideModel.fromJson(item)).toList();
          };
          return response.body['slide'];
        }
      }
    }catch(exception){
      return Future.error(exception.toString());
    }
  }
  // @override
  // void onInit() {
  //   httpClient.defaultDecoder = (map) {
  //     if (map is Map<String, dynamic>) return SlideModel.fromJson(map);
  //     if (map is List)
  //       return map.map((item) => SlideModel.fromJson(item)).toList();
  //   };
  //   httpClient.baseUrl = BASE_URL_API().SERVER+BASE_URL_API().API_SLIDE;
  // }

  // Future<SlideModel> getSlideModel(int id) async {
  //   final response = await get('slidemodel/$id');
  //   return response.body;
  // }
  //
  // Future<Response<SlideModel>> postSlideModel(SlideModel slidemodel) async =>
  //     await post('slidemodel', slidemodel);
  // Future<Response> deleteSlideModel(int id) async =>
  //     await delete('slidemodel/$id');
}
