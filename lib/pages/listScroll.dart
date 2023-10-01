import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';



class DynamicHorizontalDemo extends StatefulWidget {
  @override
  _DynamicHorizontalDemoState createState() => _DynamicHorizontalDemoState();
}

class _DynamicHorizontalDemoState extends State<DynamicHorizontalDemo> {
  List<int> data = [];
  int _focusedIndex = -1;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      data.add(Random().nextInt(100) + 1);
    }
  }

  void _onItemFocus(int index) {
    print(index);
    setState(() {
      _focusedIndex = index;
    });
  }


  Widget _buildItemDetail() {
    if (_focusedIndex<0) return Container(
      height: 250,
      child: Text("Nothing selected"),
    );

    if (data.length > _focusedIndex)
      return Container(
        height: 250,
        child: Text("index $_focusedIndex: ${data[_focusedIndex]}"),
      );

    return Container(
      height: 250,
      child: Text("No Data"),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
      double offsetY = 0.0;
  double maxPullDownDistance = 500.0; // Set your maximum pull-down distance here
  double containerHeight = 100.0;
    if (index == data.length)
      return Center(child: CircularProgressIndicator(),);

    //horizontal
    return GestureDetector(
      onVerticalDragUpdate: (details) {
          setState(() {
            print("coucou");
             final double delta = details.primaryDelta ?? 0.0;
           // Limit the offsetY to the maximum pull-down distance
              offsetY = offsetY + delta> maxPullDownDistance
                  ? maxPullDownDistance
                  : (offsetY + delta) > 0.0 ? (offsetY + delta) : 0.0;
          // offsetY += details.primaryDelta ?? 0;
        });
      },
            onVerticalDragEnd: (details) {
        // Reset the offsetY when the user releases their finger
        setState(() {
          offsetY = 0.0;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(top: offsetY),
        duration:Duration(milliseconds: 300) ,
         decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                shape: BoxShape.circle     
              ),
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 150,
              child: Text("coucou"),
            )
          ],
        ),
      ),
    );
  }

  ///Override default dynamicItemSize calculation
  double customEquation(double distance){
    // return 1-min(distance.abs()/500, 0.2);
    return 1-(distance/1000);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal List Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Horizontal List"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ScrollSnapList(
                  onItemFocus: _onItemFocus,
                  itemSize: 150,
                  itemBuilder: _buildListItem,
                  itemCount: data.length,
                  dynamicItemSize: true,
                  // dynamicSizeEquation: customEquation, //optional
                ),
              ),
              _buildItemDetail(),
            ],
          ),
        ),
      ),
    );
  }
}