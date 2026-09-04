import 'package:flutter/material.dart';
class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
        padding: EdgeInsetsGeometry.all(10),
      child:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 300,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                 border: BoxBorder.all(
                   color: Colors.grey,
                   width: 3
                 ),
                color: Colors.white54,
                ),

                  child:Column(
                    children: [
                      Text("Order Summary",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(height: 10,),

                    ]

                  )

            ),
            SizedBox(height: 10,),

            ////////////////
            Container(
                height: 200,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: BoxBorder.all(
                      color: Colors.grey,
                      width: 3
                  ),
                  color: Colors.white54,
                ),

                child:Column(
                    children: [
                      Text("Delivery Mode",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(height: 10,),

                    ]

                )

            ),
            SizedBox(height: 10,),
            ///////
            Container(
                height: 200,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: BoxBorder.all(
                      color: Colors.grey,
                      width: 3
                  ),
                  color: Colors.white54,
                ),

                child:Column(
                    children: [
                      Text("Mode of Payment",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(height: 10,),

                    ]

                )

            )
          ],
        )
        )));



  }
}

