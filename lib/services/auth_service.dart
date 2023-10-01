

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {


  //instance of firebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //instance of fireStore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  //sign user in
  Future<UserCredential>  signInWithEmailAndPassword(String email , String password) async{
     try{
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    
        // add a new  document for the user in users collections  if it doesn't  already 
          _firestore.collection('users').doc(userCredential.user!.uid).set({
            'uid': userCredential.user!.uid,
            'email': email
          }, SetOptions(merge: true));

         return userCredential;
     }
     //catch any errors
     on  FirebaseAuthException catch(e) {
       throw Exception(e.code);
     }
  }

  // sign  user  out 
    Future<void> signOut() async{
      return  await FirebaseAuth.instance.signOut();
    }
}