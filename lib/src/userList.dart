
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:slingshot/src/data/userlist.dart';
import 'package:slingshot/src/pages/pulldown.dart';
import 'package:slingshot/src/userCard.dart';

class UserList extends StatefulWidget {
  List<UserModel>? users;

  UserList({super.key, this.users});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  int _focusedIndex=-1;
  double currentPixel=0;
  int duration=500;

  late ScrollController listController;
  double Function(double distance)? dynamicItemEquation;

late double?dynamicItemOpacity;



void animateScroll(double location){
  Future.delayed(Duration.zero, () {
    listController.animateTo(
      location, 
      duration: new Duration(milliseconds:duration),
       curve: Curves.ease);
  });
}


  void initState(){
    super.initState();

  }

  void _onItemFocus(int index){
    setState(() {
      _focusedIndex = index;
    });
  }

  double customEquation(double distance){
    return 1-(distance/1000);
  }


void  _makeStory(){
  print("Coucou");
//  
// Text("Hello");
  
}

  @override
  Widget build(BuildContext context) {

        void _onItemFocus(int index) {
    print(index);
    setState(() {
      _focusedIndex = index;
    });
  }


    // return ScrollSnapList(
    //       itemBuilder: (context, index ){
    //     UserModel currentUser= widget.users![index];
    //     return UserCard(userInfo: currentUser);},
    //       itemCount: widget.users!.length, 
    //       itemSize: 100,
    //       onItemFocus: _onItemFocus,
    //        dynamicItemSize: true);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.users!.length,
      itemBuilder: (context, index ){
        UserModel currentUser= widget.users![index];
        return UserCard(userInfo: currentUser,
        function: _makeStory,
        );

      });
  }
}
