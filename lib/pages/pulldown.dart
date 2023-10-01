import 'package:flutter/material.dart';

import '../src/userCard.dart';


class PullDownContainerWidget extends StatefulWidget {

  UserCard?  user;

  PullDownContainerWidget({this.user});
  
  @override
  _PullDownContainerWidgetState createState() =>
      _PullDownContainerWidgetState();
}

class _PullDownContainerWidgetState extends State<PullDownContainerWidget> {
  double offsetY = 0.0;
  double maxPullDownDistance = 500.0; // Set your maximum pull-down distance here
  double containerHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
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
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: containerHeight,
          width:100,
          color: Colors.blue,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: offsetY),
          child: widget.user,
        ),

      ),
    );
  }
}
