import 'package:fashion_design/Google_login/authentication.dart';
import 'package:fashion_design/Google_login/signIn_button.dart';
import 'package:fashion_design/Google_login/userProfile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Flexible(
                    //   flex: 1,
                    //   child: Image.asset(
                    //     'assets/firebase_logo.png',
                    //     height: 160,
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    Text(
                      'FlutterFire',
                      style: TextStyle(
                 
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      'Authentication',
                      style: TextStyle(
                    
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                     return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                   
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Authentication {
  static Future<FirebaseApp> initializeFirebase({required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic
     User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => UserInfoScreen(
          user: user,
        ),
      ),
    );
  }

    return firebaseApp;
  }

  static signOut({required BuildContext context}) {

  }
}