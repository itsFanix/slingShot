
import 'package:flutter/material.dart';
import 'package:slingshot/src/data/userlist.dart';

class UserCard extends StatefulWidget {
  UserModel? userInfo;
   final function;
   UserCard({super.key, this.userInfo, this.function});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  double offsetY= 0.0;
  double maxPullDownDistance = 200.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details){
         setState(() {
            print('Coucou');
             final double delta = details.primaryDelta ?? 0.0;
           // Limit the offsetY to the maximum pull-down distance
              offsetY = offsetY + delta> maxPullDownDistance
                  ? maxPullDownDistance
                  :  (offsetY + delta) > 0.0 ? (offsetY + delta) : 0.0;
          // offsetY += details.primaryDelta ?? 0;
        });
      },
      onVerticalDragEnd: (details) {
        // Reset the offsetY when the user releases their finger
        setState(() {
          offsetY = 0.0;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 100,
              width: 100,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image:DecorationImage(
                        image: NetworkImage(widget.userInfo!.imgUrl!,),
                      fit: BoxFit.cover,
                    ), 
                      shape: BoxShape.circle
                    ),
                    alignment: Alignment.topCenter,
                  
                
                  ),
                  Text('${widget.userInfo!.name}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18
                    ),
                  )
                  
              ]),
            ),
       
      ),
    );
        
  }
}