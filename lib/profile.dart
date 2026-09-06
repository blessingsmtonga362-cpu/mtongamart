import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Column(
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
             onTap: (){},
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
         Padding(
             padding: EdgeInsets.only(top:10,bottom:10,left:30,right: 30),
             child: Container(
            height: 450,
            width: double.infinity,
            decoration: BoxDecoration(
             color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.5
              )
            ),
               child: Container(
                 padding: EdgeInsets.only(left: 10,right: 10),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(height: 10,),
                     Container(
                       padding: EdgeInsets.symmetric(
                         vertical: 10
                       ),
                       decoration: BoxDecoration(
                         border: Border(
                           bottom: BorderSide(
                             color: Colors.grey.shade300,
                             width: 1.5
                           )
                       )),
                     child:Row(
                       children: [
                         Expanded(child: Text("Personal information",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)),
                         SizedBox(width:10,),
                         Text("Edit",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)

                       ],
                     )),
                     SizedBox(height: 10,),


                     /////////////

                     Text("Full Name ",style: TextStyle(color: Colors.grey.shade500,fontSize: 25,fontWeight: FontWeight.w400)),
                     TextField(
                       decoration: InputDecoration(
                         hintText: 'Blessings Mtonga',

                         filled: true,
                         fillColor: Colors.white,

                         contentPadding: const EdgeInsets.symmetric(
                           horizontal: 20,
                           vertical: 15,
                         ),

                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide(
                             color: Colors.grey.shade300,
                             width: 1.5,
                           ),
                         ),

                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: const BorderSide(
                             color: Colors.teal,
                             width: 2,
                           ),
                         ),
                       ),
                     ),
                     ////////////

                     Text("Phone Number ",style: TextStyle(color: Colors.grey.shade500,fontSize: 25,fontWeight: FontWeight.w400)),
                     TextField(
                       decoration: InputDecoration(
                         hintText: '+265 992 708 855',

                         filled: true,
                         fillColor: Colors.white,

                         contentPadding: const EdgeInsets.symmetric(
                           horizontal: 20,
                           vertical: 15,
                         ),

                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide(
                             color: Colors.grey.shade300,
                             width: 1.5,
                           ),
                         ),

                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: const BorderSide(
                             color: Colors.teal,
                             width: 2,
                           ),
                         ),
                       ),
                     ),
                     ///////////////////////
                     Text("Email Address ",style: TextStyle(color: Colors.grey.shade500,fontSize: 25,fontWeight: FontWeight.w400)),
                     TextField(
                       decoration: InputDecoration(
                         hintText: 'blessingsmtonga362@gmail.com',

                         filled: true,
                         fillColor: Colors.white,

                         contentPadding: const EdgeInsets.symmetric(
                           horizontal: 20,
                           vertical: 15,
                         ),

                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide(
                             color: Colors.grey.shade300,
                             width: 1.5,
                           ),
                         ),

                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: const BorderSide(
                             color: Colors.teal,
                             width: 2,
                           ),
                         ),
                       ),
                     ),
//////////////////////////////////
                     Text("Delivery Address  ",style: TextStyle(color: Colors.grey.shade500,fontSize: 25,fontWeight: FontWeight.w400)),
                     TextField(
                       decoration: InputDecoration(
                         hintText: 'Limbe ,Pacific tower floor 18',

                         filled: true,
                         fillColor: Colors.white,

                         contentPadding: const EdgeInsets.symmetric(
                           horizontal: 20,
                           vertical: 15,
                         ),

                         enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide(
                             color: Colors.grey.shade300,
                             width: 1.5,
                           ),
                         ),

                         focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(12),
                           borderSide: const BorderSide(
                             color: Colors.teal,
                             width: 2,
                           ),
                         ),
                       ),
                     ),








                   ],

                 ),
               ),

          ))
        ]
    ));
  }
}

