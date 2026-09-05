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
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                 border: BoxBorder.all(
                   color: Colors.grey.shade300,
                   width: 1.5
                 ),
                color: Colors.white54,
                ),

                  child:Column(
                    children: [
                      Text("Order Summary",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(height: 10,),
                      Padding(padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/iphone.jpg",height: 110,width: 100,fit: BoxFit.cover),
                          ),

                          SizedBox(width: 10,),
                          Expanded(child: Column(
                              children: [
                                Text("iphone 12 pro max",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                               // Text("",style: TextStyle(color: Colors.black26,fontSize: 15,fontWeight: FontWeight.w500)),
                                Text("Qty : 2",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400))]) ),
                          Expanded(child: Text("MK 210, 000",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
                        ],
                      ),),
                      Padding(padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/nike.jpg",height: 110,width: 100,fit: BoxFit.cover),
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: Column(
                                children: [
                                  Text("Nike air jordan 1's",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                                  Text("Qty : 1",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400))]) ),
                            Expanded(child: Text("MK 75, 000",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
                          ],
                        ),),
                    Padding(padding: EdgeInsets.all(10),child:Row(

                        children: [
                          Expanded(child: Text("SubTotal ",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900))),
                          Expanded(child: Text("MK 285, 000"))

                        ]
                      ),),
                      Padding(padding: EdgeInsets.all(10),
                        child:
                        Row(
                            children: [
                              Expanded(child: Text("Delivery ",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900),)),
                              Expanded(child: Text("MK 2,000"))

                            ]
                        ),),
                      Padding(padding: EdgeInsets.all(10),
                        child:
                        Row(
                            children: [
                              Expanded(child: Text("Total Price ",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900),)),
                              Expanded(child: Text("MK 287,000"))

                            ]
                        ),)

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
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
                color: Colors.white,
              ),

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    // Title
                    const Text(
                      "Delivery Mode",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Choose how you want to receive your order",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Store option
                    Container(
                      height: 55,
                      width: double.infinity,

                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),

                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),

                        color: Colors.grey.shade100,
                      ),

                      child: Row(
                        children: [

                          const Icon(
                            Icons.store,
                            color: Colors.green,
                            size: 28,
                          ),

                          const SizedBox(width: 12),

                          const Expanded(
                            child: Text(
                              "Limbe Store",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            ///////
            Container(
                height: 350,
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: BoxBorder.all(
                      color: Colors.grey.shade300,
                      width: 1.5
                  ),
                  color: Colors.white54,
                ),

                child:Padding(padding: EdgeInsets.all(10),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mode of Payment",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
                      SizedBox(height: 10,),
                      Text(
                        "Choose the mode of Payment ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        height: 73,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.grey.shade300
                          )


                          ),
                          child:Row(
                            children: [
                              ClipRRect(
                                   borderRadius:BorderRadius.circular(7),
                                  child:Image.asset("assets/images/men.jpg",height: 90,width: 90,fit:BoxFit.fill,)),
                              SizedBox(width: 70),
                              Text("TNM Mpamba",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                            ],
                            
                          )
                        ),

                      SizedBox(height: 10,),
                      /////////////////
                      Container(
                          height: 73,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical:  4
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.shade300
                              )


                          ),
                          child:Row(
                            children: [
                              ClipRRect(
                                  borderRadius:BorderRadius.circular(7),
                                  child:Image.asset("assets/images/men.jpg",height: 90,width: 90,fit:BoxFit.fill,)),
                              SizedBox(width: 70),
                              Text("TNM Mpamba",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                            ],

                          )
                      ),

                      SizedBox(height: 10,),
                      /////////////////////////
                      Container(
                          height: 73,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Colors.grey.shade300
                              )


                          ),
                          child:Row(
                            children: [
                              ClipRRect(
                                  borderRadius:BorderRadius.circular(7),
                                  child:Image.asset("assets/images/men.jpg",height: 90,width: 90,fit:BoxFit.fill,)),
                              SizedBox(width: 70),
                              Text("TNM Mpamba",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                            ],

                          )
                      ),




                    ])

                )



            )]
    ))));
  }
}

