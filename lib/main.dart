

import 'package:fashion_design/Model/subCategoriesModel.dart';
import 'package:fashion_design/Provider/categories_provider.dart';
import 'package:fashion_design/Provider/subCategories_provider.dart';
import 'package:fashion_design/Screen_Page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CategoriesProvider>(
          create: ((context) => CategoriesProvider())),
       ChangeNotifierProvider(create: ((context)=>SubCategoriesProvider()))   
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int countNumber = 0;
  bool isIncrement = false;
  bool isDecrement = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(countNumber.toString()),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isIncrement = !isIncrement;
                    });
                  },
                  icon: isDecrement
                      ? Icon(Icons.pause)
                      : Icon(Icons.arrow_downward)),
              Text(countNumber.toString()),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isDecrement = !isDecrement;
                    });
                  },
                  icon: isIncrement
                      ? Icon(Icons.pause)
                      : Icon(Icons.arrow_downward))
            ],
          ),
        ),
      ),
    );
  }
}
