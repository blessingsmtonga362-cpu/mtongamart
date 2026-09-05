import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(

        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 50,
              horizontal: 100
            ),
         child:Stack(
           children: [
           CircleAvatar(
           radius: 100,
           backgroundImage: AssetImage("assets/images/iphone.jpg"),
         ),
           Positioned(bottom:0,right: 0,
           child:GestureDetector(
             onTap: (){
               print("edit");
             },
             child: CircleAvatar(
             radius: 20,
             backgroundColor: Colors.blue,
             child: Icon(Icons.edit,color: Colors.white,size: 20,),
           )))])),
    Container(
    padding: EdgeInsets.symmetric(
    vertical: 0,
    horizontal: 75
    ),
    child:Column(
      children: [
        Text("Blessings Mtonga",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Text("Blessingsmtonga362@gmail.com",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
      ],
    )),
         Padding(padding: EdgeInsets.all(20),child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
             color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.5
              )
            )
          ))
        ]
    );
  }
}

