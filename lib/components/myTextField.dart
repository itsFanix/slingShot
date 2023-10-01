import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscurText;
  
  const MyTextField({super.key,
    required this.controller,
    required this.hintText,
    required this.obscurText,
  });

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: controller,
      obscureText: obscurText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: Colors.blue.shade200)
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color:Colors.white),
        ),
        fillColor:  Colors.grey.shade200,
        filled:true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.blueGrey)

      ),
    );
  }
}