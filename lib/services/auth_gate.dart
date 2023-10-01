import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:slingshot/pages/homePage.dart';
import 'package:slingshot/pages/loginPage.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          //user is logged in
          if(snapshot.hasData) 
            return const HomePage();
          
          //user is  not  logged in 
          else {
            return  LoginPage(onTap: () {});
          }

        },
      )
    );
  }
}