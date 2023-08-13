
import 'package:flutter/material.dart';
import 'package:slingshot/src/data/userlist.dart';
import 'package:slingshot/src/userCard.dart';

class UserList extends StatefulWidget {
  List<UserModel>? users;

  UserList({super.key, this.users});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.users!.length,
      itemBuilder: (context, index ){
        UserModel currentUser= widget.users![index];
        return UserCard(userInfo: currentUser);

      });
  }
}
