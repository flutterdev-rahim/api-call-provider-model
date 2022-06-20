import 'package:fashion_design/App_Color/app_color.dart';
import 'package:fashion_design/Provider/categories_provider.dart';
import 'package:fashion_design/Provider/subCategories_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../Api_Service.dart/catagories_service.dart';
import '../Model/categoriesModel.dart';
import '../Model/subCategoriesModel.dart';
import '../Model/subSubCategoriesModel.dart';
import '../Model/subSubCategoriesModel.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  CategoriesProvider? categoriesProvider;
  SubCategoriesProvider? subCategoriesProvider;
  // List<Getcategory> catagorieslist = [];
  // List<Subcategory> subcategorieslist = [];
  List<Subsubcategory> subsubcategorieslist = [];
  // Getcategorydata() async {
  //   var data = await CategoriesService().getCategories();
  //   setState(() {
  //     catagorieslist = data.getcategory!;
  //   });
  //   // print(Categories);
  // }

  // GetSubcategories() async {
  //   var data = await SubCategoriesService().getSubCategories();
  //   setState(() {
  //     subcategorieslist = data.subcategory!;
  //   });
  // }

  GetSubSubcategories() async {
    var data = await SubSubCategoriesService().getSubSubCategories();
    setState(() {
      subsubcategorieslist = data.subsubcategories!;
    });
  }

  @override
  void initState() {
    //Getcategorydata();
    categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    categoriesProvider?.Getcategorydata();

    // GetSubcategories();
    subCategoriesProvider = Provider.of<SubCategoriesProvider>(context, listen: false);
    subCategoriesProvider!.getSubCategoriesdata();

    GetSubSubcategories();

    // TODO: implement initState
    super.initState();
  }

  int gobalIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        // Add a ListView to the Maindrawer. This ensures the user can scroll
        // through the options in the Maindrawer if there isn't enough vertical
        // space to fit everything.
        child: SingleChildScrollView(
          child: Column(
            // Important: Remove any padding from the ListView.

            children: [
              Container(
                height: 200,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: appColor().mainColor,
                  ),
                  child: Center(child: Text('MainDrawer Header')),
                ),
              ),
              ListView.builder(
                  itemCount: categoriesProvider!.catagorieslist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: ((context, index) {
                    var categoriesIndex =
                        categoriesProvider!.catagorieslist[index];

                    return categoriesProvider!.isLoading == false
                        ? Column(
                            children: [
                              Container(
                                  child: ExpansionTile(
                                title: Text(
                                    categoriesIndex.categoryName.toString()),
                                children: [
                                  ListView.builder(
                                    itemCount: subCategoriesProvider!
                                        .subCategorieslist.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: ((context, gobalIndex) {
                                      var subCategoriesIndex =
                                          subCategoriesProvider!
                                              .subCategorieslist[gobalIndex];
                                      return Container(
                                        padding: EdgeInsets.only(left: 20),
                                        child: categoriesIndex.id.toString() ==
                                                subCategoriesIndex.categoryId
                                                    .toString()
                                            ? ExpansionTile(
                                                title: Text(subCategoriesIndex
                                                    .subCategorySlugName
                                                    .toString()),
                                                children: [
                                                  ListView.builder(
                                                      itemCount:
                                                          subsubcategorieslist
                                                              .length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          ((context, index) {
                                                        var subsubindex =
                                                            subsubcategorieslist[
                                                                index];
                                                        return Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 30),
                                                            child: subCategoriesIndex
                                                                        .categoryId
                                                                        .toString() ==
                                                                    subsubindex
                                                                        .subcategoryId
                                                                        .toString()
                                                                ? ExpansionTile(
                                                                    title: Text(subsubindex
                                                                        .subsubcategorySlugName
                                                                        .toString()))
                                                                : Container());
                                                      }))
                                                ],
                                              )
                                            : Container(),
                                      );
                                    }),
                                  )
                                ],
                              )),
                            ],
                          )
                        : SpinKitThreeBounce(
                            itemBuilder: ((context, index) {
                              return DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index.isEven
                                          ? Colors.red
                                          : Colors.green));
                            }),
                          );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
