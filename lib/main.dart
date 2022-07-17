import 'package:fashion_design/Model/subCategoriesModel.dart';
import 'package:fashion_design/Provider/categories_provider.dart';
import 'package:fashion_design/Provider/subCategories_provider.dart';
import 'package:fashion_design/Screen_Page/all_brands.dart';
import 'package:fashion_design/Screen_Page/home_page.dart';
import 'package:fashion_design/otp_verification/otp_senderPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Google_login/signin_screen.dart';

void main() {
  runApp(

    MultiProvider(
    providers: [
      ChangeNotifierProvider<CategoriesProvider>(
          create: ((context) => CategoriesProvider())),
       ChangeNotifierProvider(create: ((context)=>SubCategoriesProvider()))
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllBrandsFiltering(),
    ),
  ));
}
// import 'package:flutter/material.dart';
// import 'package:easy_sidemenu/easy_sidemenu.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'easy_sidemenu Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'easy_sidemenu Demo'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
///



// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   PageController page = PageController();

//   List datalist=[1,2,3,4,5,6,7,8];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SideMenu(
//             controller: page,
//             // onDisplayModeChanged: (mode) {
//             //   print(mode);
//             // },
//             style: SideMenuStyle(
//               openSideMenuWidth: 400,
//               decoration: BoxDecoration(
//               color: Colors.black45
//             ),
//               displayMode: SideMenuDisplayMode.auto,
//               hoverColor: Colors.blue[100],
//               selectedColor: Colors.lightBlue,
//               selectedTitleTextStyle: const TextStyle(color: Colors.white),
//               selectedIconColor: Colors.white,
//               // decoration: BoxDecoration(
//               //   borderRadius: BorderRadius.all(Radius.circular(10)),
//               // ),
//               // backgroundColor: Colors.blueGrey[700]
//             ),
//             title: Column(
//               children: [
//                 ConstrainedBox(
//                   constraints: const BoxConstraints(
//                     maxHeight: 150,
//                     maxWidth: 150,
//                   ),
                  
//                 ),
//                 const Divider(
//                   indent: 8.0,
//                   endIndent: 8.0,
//                 ),
//               ],
//             ),
//             footer: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(
//                 'mohada',
//                 style: TextStyle(fontSize: 15,color: Colors.black),
//               ),
//             ),
       
//             items: [



//               SideMenuItem(
//                 priority: 0,
//                 title: '',
//                 onTap: () {
//                   page.jumpToPage(0);
//                 },
//                 icon: const Icon(Icons.home),
//                 badgeContent: const Text(
//                   '3',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               SideMenuItem(
//                 priority: 1,
//                 title: 'Users',
//                 onTap: () {
//                   page.jumpToPage(1);
//                 },
//                 icon: const Icon(Icons.supervisor_account),
//               ),
//               SideMenuItem(
//                 priority: 2,
//                 title: '',
//                 onTap: () {
//                   page.jumpToPage(2);
//                 },
//                 icon: const Icon(Icons.file_copy_rounded),
//               ),
//               SideMenuItem(
//                 priority: 3,
//                 title: '' ,
//                 onTap: () {
//                   page.jumpToPage(3);
//                 },
//                 icon: const Icon(Icons.download),
//               ),
//               SideMenuItem(
//                // badgeContent:Scaffold(body: Container(child: Text('Allah Borosha'),)) ,
//                 priority: 4,
//                 title: '',
//                 onTap: () {
//                   page.jumpToPage(4);
//                 },
//                 icon: const Icon(Icons.settings),
//               ),
//               SideMenuItem(
//                 priority: 6,
//                 title: 'Exit',
//                 onTap: () async {},
//                 icon: const Icon(Icons.exit_to_app),
//               ),
//             ],
//           ),
//           Expanded(
//             child: PageView(
//               controller: page,
//               children: [
//                 Container(
//                   color: Colors.white,
//                   child: const Center(
//                     child: Text(
//                       'Allah',
//                       style: TextStyle(fontSize: 35),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   child: const Center(
//                     child: Text(
//                       'Allah',
//                       style: TextStyle(fontSize: 35),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   child: const Center(
//                     child: Text(
//                       'Files',
//                       style: TextStyle(fontSize: 35),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   child: const Center(
//                     child: Text(
//                       'Download',
//                       style: TextStyle(fontSize: 35),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: Colors.white,
//                   child: const Center(
//                     child: Text(
//                       'Settings',
//                       style: TextStyle(fontSize: 35),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }