import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slingshot/pages/listScroll.dart';
import 'package:slingshot/pages/pulldown.dart';
import 'package:slingshot/pages/slingShotPage.dart';
import 'package:slingshot/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _selectedIndex = 0;

  // void _navigateBottomNavBar(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  // //different pages to navigate to
  // final List<Widget> _children = [
  //   // Center(child: Text('HOME', style: TextStyle(color: Colors.black),)),
  //   // AddContainerOnPullDownWidget(),

  //   // AddContainerAboveOnPullDownWidget(),
  //   // PullDownItemWidget(),
  //   PullDownContainerWidget(),
  //   //  PullDownContainerWidget(),
  //   // PullDownItem(item: ItemModel(),)
  //   DynamicHorizontalDemo(),
  //   // Text('SlingShot', style: TextStyle(color: Colors.black),),
  //   const SlingShotPage(title: 'slingShot')
  // ];

  //instance  of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // sign user out
  void signOut() {
    //get auth service
    final authservice = Provider.of<AuthService>(context, listen: false);
    authservice.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SlingShot"),
        actions: [
          // sign out  button
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout_sharp))
        ],
      ),
      body: _buildUserList(),
    );
  }

//build a list of users  except for  the  current  logged in user

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading..');
          }

          return ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!.docs
                .map<Widget>((doc) => _buildUserListItem(doc))
                .toList(),
          );
        });
  }

  //build  individual  user list items
  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    //display all  users  except current user
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.brown.shade800,
          child: const Text('AH'),
        ),
        title: Text("user"),
        onTap: () {
          //pass the clicked  user's UID to the
          //send  a message to thet user
        },
      );
    } else {
      //return empty container
      return Container();
    }
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: _children[_selectedIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //       currentIndex: _selectedIndex,
  //       onTap: _navigateBottomNavBar,
  //       type: BottomNavigationBarType.fixed,
  //       items: [
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.home_mini_outlined), label: 'home'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.account_tree_sharp), label: 'sling'),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.circle_rounded), label: 'sling')
  //       ],
  //     ),
  //   );
  // }
}
