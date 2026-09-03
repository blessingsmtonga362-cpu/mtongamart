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
                      color:Color(0xFFBAE6FD),
                      width: 1.5
                    )
                ),
              child:Stack(
                  children:[Positioned.fill(child:Image.asset("assets/images/macbook.jpg" ,width: double.infinity)),
                            Positioned(bottom: 3,left: 10,child: Text("Electronics",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.black87),),)])
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
                            color:Color(0xFFBAE6FD),
                            width: 1.5
                        )
                    ),
                    child:Stack(
                children:[Positioned.fill(child:Image.asset("assets/images/messi1.jpg" ,height:double.infinity,width: 60)),
                Positioned(bottom: 3,left: 10,child: Text("Clothes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.black),),)])),
                ),
                SizedBox(width: 10,),
                Expanded(child: Container(
                    height:200,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color:Color(0xFFBAE6FD),
                            width: 1.5
                        )
                    ),
                    child:Stack(
                        children:[Positioned.fill(child:Image.asset("assets/images/groceries2.jpg" ,width:double.infinity)),
                          Positioned(bottom: 5,left: 10,child: Text("Groceries",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.black),),)])
                ))]



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
                            color:Color(0xFFBAE6FD),
                            width: 1.5
                          )
                      ),
                      child:Stack(
                          children:[Positioned.fill(child:Image.asset("assets/images/nike.jpg" ,height:double.infinity,width: 60)),
                            Positioned(bottom: 5,left: 14,child: Text("Shoes",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.black),),)])),
                  ),
                  SizedBox(width: 10,),
                  Expanded(child: Container(
                      height:200,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color:Color(0xFFBAE6FD),
                            width: 1.5
                          )
                      ),
                      child:Stack(
                          children:[Positioned.fill(child:Image.asset("assets/images/samsung.jpg" ,height:double.infinity,width: 60)),
                            Positioned(bottom: 5,left: 14,child: Text("Electronics",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.black87),),)])),
                  )]



            )

          ],
        ),

    ));
  }
}
