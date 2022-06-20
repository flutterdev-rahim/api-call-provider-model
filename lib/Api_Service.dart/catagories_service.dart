import 'package:fashion_design/Model/subCategoriesModel.dart';
import 'package:fashion_design/Model/subSubCategoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../Model/categoriesModel.dart';

class CategoriesService {
  Future<CatagoriesModel> getCategories() async {
    Map<String, dynamic>? result;
    try {
      String url = 'https://bppshops.com/api/bs/category_view';
      http.Response response = await http.get(Uri.parse(url));

      print('Categories : ${response.body}');
      if (response.statusCode == 200) {
        result = convert.jsonDecode(response.body);
        return CatagoriesModel.fromJson(result!);
      } else {
        Container(
          child: SpinKitThreeBounce(
            itemBuilder: ((context, index) {
              return DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: index.isEven ? Colors.red : Colors.green));
            }),
          ),
        );
      }
    } catch (e) {
      print(' Error Has :${e.toString()}');
    }

    return CatagoriesModel.fromJson(result!);
  }
}

class SubCategoriesService {
  Future<SubCatagoriesModel> getSubCategories() async {
    String url = 'https://bppshops.com/api/sidebar_subcategory';
    http.Response response = await http.get(Uri.parse(url));

    print('SubCategories : ${response.body}');
    return subCatagoriesModelFromJson(response.body);
  }
}

class SubSubCategoriesService {
  Future<SubSubCatagoriesModel> getSubSubCategories() async {
    String url = 'https://bppshops.com/api/sidebar_SubSubProduct';
    http.Response response = await http.get(Uri.parse(url));

    print('SubSubCategories : ${response.body}');
    return subSubCatagoriesModelFromJson(response.body);
  }
}
