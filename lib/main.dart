import 'package:flutter/material.dart';
import 'package:slingshot/src/pages/homePage.dart';

import 'src/pages/slingShotPage.dart';





void main() {
  runApp(const MyApp());
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
      home: HomePage(),
    );
  }
}

