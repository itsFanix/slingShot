
import 'package:flutter/material.dart';
import 'package:slingshot/src/data/userlist.dart';

class UserCard extends StatelessWidget {
  UserModel? userInfo;

   UserCard({super.key, this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: NetworkImage(userInfo!.imgUrl!,),
                  fit: BoxFit.cover,
                ), 
                  shape: BoxShape.circle
                ),
                alignment: Alignment.topCenter,
              

              ),
              Text('${userInfo!.name}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
              )
    
          ]),
   
    );
        
  }
}