import 'package:flutter/material.dart';
import 'package:slingshot/src/home/listScroll.dart';
import 'package:slingshot/src/home/slingShotPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _selectedIndex = 0;

  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
    }
    
    //different pages to navigate to
        final List<Widget> _children = [
            Center(child: Text('HOME', style: TextStyle(color: Colors.black),)),
            
             DynamicHorizontalDemo(),
            // Text('SlingShot', style: TextStyle(color: Colors.black),),
            const SlingShotPage(title: 'slingShot')
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_mini_outlined), label:'home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_tree_sharp), label:'sling'),
          BottomNavigationBarItem(icon: Icon(Icons.circle_rounded), label:'sling')
        ],
      ),
    );
  }
}

