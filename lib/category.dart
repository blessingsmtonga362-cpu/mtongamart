import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
    Padding(padding: EdgeInsets.only(left:15,top: 15,right: 10,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Shop by Category",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 26),),
            Text("Find exactly what you`re looking for .",style: TextStyle(color: Colors.grey,fontSize: 15)),
            SizedBox(height: 10,),
            Container(
                height:320,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:Colors.lightBlue,
                    )
                ),
              child:Image.asset("assets/images/jbl sound.jpg" ,width: double.infinity)
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(child: Container(
                    height:200,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:Colors.lightBlue,
                        )
                    ),
                    child:Image.asset("assets/images/mic.jpg" ,width: double.infinity)),
                ),
                SizedBox(width: 10,),
                Expanded(child: Container(
                    height:200,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:Colors.lightBlue,
                        )
                    ),
                    child:Image.asset("assets/images/samsung.jpg" ,width: double.infinity)),
                )]



            ),
            SizedBox(height: 10,),
            Row(
                children: [
                  Expanded(child: Container(
                      height:200,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:Colors.lightBlue,
                          )
                      ),
                      child:Image.asset("assets/images/iphone.jpg" ,fit:BoxFit.cover,width: double.infinity)),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: Container(
                      height:200,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:Colors.lightBlue,
                          )
                      ),
                      child:Image.asset("assets/images/macbook.jpg" ,width: double.infinity)),
                  )]



            )

          ],
        ),

    ));
  }
}
