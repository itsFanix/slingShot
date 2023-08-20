
import 'package:flutter/material.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:slingshot/src/data/userlist.dart';
import 'package:slingshot/src/userCard.dart';

class UserList extends StatefulWidget {
  List<UserModel>? users;

  UserList({super.key, this.users});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  int _focusedIndex=-1;



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


  double calculateScale(int index, double itemSize) {
    //scroll-pixel position for index to be at the center of ScrollSnapList
    double intendedPixel = index * itemSize;
    double difference = intendedPixel - currentPixel;

    if (widget.dynamicSizeEquation != null) {
      //force to be >= 0
      double scale = widget.dynamicSizeEquation!(difference);
      return scale < 0 ? 0 : scale;
    }

    //default equation
    return 1 - min(difference.abs() / 500, 0.4);
  }

  Widget _buildItem(BuildContext context, int index, double itemSize){

    Widget child;
    child =Transform.scale(
      scale: calculateScale(index, itemSize),
      child: ,

    )


    return child;
  }

  @override
  Widget build(BuildContext context) {


      return ScrollSnapList(
        onItemFocus: _onItemFocus,
        itemCount:widget.users!.length,
        dynamicItemSize: true,
           itemBuilder: (context, index ){
        UserModel currentUser= widget.users![index];
        return UserCard(userInfo: currentUser);

      }, itemSize: 90,);
    // return ScaledList(
      
    //   itemCount: widget.users!.length,
    //   itemBuilder: ((index, selectedIndex) {
    //         UserModel currentUser= widget.users![index];
    //      return UserCard(userInfo: currentUser);
    //   }), itemColor: (int index) { 
    //               return Colors.grey;

    //    },
    // );
    // return ListView.builder(
    //   scrollDirection: Axis.horizontal,
    //   itemCount: widget.users!.length,
    //   itemBuilder: (context, index ){
    //     UserModel currentUser= widget.users![index];
    //     return UserCard(userInfo: currentUser);

    //   });
  }
}
