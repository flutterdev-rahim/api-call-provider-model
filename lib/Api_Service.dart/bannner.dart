import 'dart:convert';

//import 'package:bpp_shop/fashion/model/Fashion_Model/banner_model.dart';
import 'package:fashion_design/Model/banner.dart';
import 'package:http/http.dart' as http;

class BannerService {
  Future<BannerModel> getBannerService() async {
    Map<String, dynamic>? result;
    try {
      String url = 'https://bppshops.com/api/fashion/banner';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
          result = jsonDecode(response.body);
        print( 'Banner data: $result');
        return BannerModel.fromJson(result!);
      }
    } catch (e) {
      print(e.toString());
    }
    return BannerModel.fromJson(result!);
  }
}