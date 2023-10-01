import 'package:flutter/material.dart';
import 'package:slingshot/data/userlist.dart';
import 'package:slingshot/src/userList.dart';

class SlingShotPage extends StatefulWidget {
  final String title;
  const SlingShotPage({super.key, required this.title});
  @override
  State<SlingShotPage> createState() => _SlingShotPageState();
}

class _SlingShotPageState extends State<SlingShotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          Container(
            height: 250,
            child:  UserList(users: Users.userList),
            
          )
         
        ]));
  }
} 
