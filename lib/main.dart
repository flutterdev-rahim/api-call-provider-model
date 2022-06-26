// import 'package:fashion_design/Model/subCategoriesModel.dart';
// import 'package:fashion_design/Provider/categories_provider.dart';
// import 'package:fashion_design/Provider/subCategories_provider.dart';
// import 'package:fashion_design/Screen_Page/home_page.dart';
// import 'package:fashion_design/otp_verification/otp_senderPage.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'Google_login/signin_screen.dart';

// void main() {
//   runApp(

//     MultiProvider(
//     providers: [
//       ChangeNotifierProvider<CategoriesProvider>(
//           create: ((context) => CategoriesProvider())),
//        ChangeNotifierProvider(create: ((context)=>SubCategoriesProvider()))
//     ],
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignInScreen(),
//     ),
//   ));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int countNumber = 0;
//   bool isIncrement = false;
//   bool isDecrement = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(countNumber.toString()),
//               IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isIncrement = !isIncrement;
//                     });
//                   },
//                   icon: isDecrement
//                       ? Icon(Icons.pause)
//                       : Icon(Icons.arrow_downward)),
//               Text(countNumber.toString()),
//               IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isDecrement = !isDecrement;
//                     });
//                   },
//                   icon: isIncrement
//                       ? Icon(Icons.pause)
//                       : Icon(Icons.arrow_downward))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Google_login/userProfile_screen.dart';
import 'Screen_Page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<User?> signInWithGoogle() async {
    try {
      //SIGNING IN WITH GOOGLE
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      //CREATING CREDENTIAL FOR FIREBASE
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      //SIGNING IN WITH CREDENTIAL & MAKING A USER IN FIREBASE  AND GETTING USER CLASS
      final userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      //CHECKING IS ON
      assert(!user!.isAnonymous);
      assert(await user!.getIdToken() != null);

      final User? currentUser = await _auth.currentUser;
      assert(currentUser!.uid == user!.uid);
      print(user);

      if (user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => UserInfoScreen(user: user,))));
      }

      return user;
    } catch (e) {
      print(e);
    }
  }

  void signOut() async {
    await googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SignInButton(Buttons.Google, onPressed: () {
            signInWithGoogle();
          }),
          ElevatedButton(onPressed: signOut, child: Text('SignOut'))
        ],
      )),
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


