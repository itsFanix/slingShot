import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slingshot/pages/homePage.dart';
import 'package:slingshot/pages/loginPage.dart';
import 'package:slingshot/services/auth_gate.dart';
import 'package:slingshot/services/auth_service.dart';
 

import 'firebase_options.dart';
import 'pages/slingShotPage.dart';





void main() async {

  //Iniatlize a Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(create: (context) => AuthService(), child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {

  
  const  MyApp({super.key});

 

  
 
  // This widget is the root of your application.
  @override        
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'slingshot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: AuthGate(),
    );
  }
}

