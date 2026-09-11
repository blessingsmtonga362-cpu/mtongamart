import 'package:flutter/material.dart';
import '../data/cart.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String selectedDelivery = "shop";

  @override
  Widget build(BuildContext context) {
    double subtotal=0;
    for(var item in cart.items){
      subtotal+=item.product.price*item.quantity;
    }


    double delivery;
    if(selectedDelivery=="shop"){
      delivery=0;
    }else{
      delivery=2100;
    }
    double total=subtotal+delivery;


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
                      /////////////////
                      // Dynamic cart items
                      Expanded(
                        child: ListView.builder(
                          itemCount: cart.items.length,
                          itemBuilder: (context, index) {
                            final item = cart.items[index];

                            return Padding(
                              padding: const EdgeInsets.all(10),

                              child: Row(
                                children: [

                                  // Product image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item.product.image,
                                      height: 80,
                                      width: 75,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  // Product name + quantity
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          item.product.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        const SizedBox(height: 5),

                                        Text(
                                          "Qty : ${item.quantity}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Product total
                                  Text(
                                    "MK ${(item.product.price * item.quantity).toStringAsFixed(0)}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      /////////////////////////
                      Padding(padding: EdgeInsets.all(10),
                        child:
                        Row(
                            children: [
                              Expanded(child: Text("Subtotal ",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900),)),
                              Expanded(child: Text("MK ${subtotal.toStringAsFixed(0)}"))

                            ]
                        ),),
                      ////////////////
                      Padding(padding: EdgeInsets.all(10),
                        child:
                        Row(
                            children: [
                              Expanded(child: Text("Delivery ",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900),)),
                              Expanded(child: Text("MK ${delivery.toStringAsFixed(0)}"))

                            ]
                        ),),
                      Padding(padding: EdgeInsets.all(10),
                        child:
                        Row(
                            children: [
                              Expanded(child: Text("Total Price ",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w900),)),
                              Expanded(child: Text("MK ${total.toStringAsFixed(2)}"))

                            ]
                        ),)

                    ]

                  )

            ),
            SizedBox(height: 10,),
            ////////////////
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Delivery Mode",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Choose how you want to receive your order",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // SHOP OPTION
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedDelivery = "shop";
                      });
                    },
                    child: Row(
                      children: [

                        Radio<String>(
                          value: "shop",
                          activeColor: const Color(0xFF0284C7),
                          groupValue: selectedDelivery,
                          onChanged: (value) {
                            setState(() {
                              selectedDelivery = value!;
                            });
                          },
                        ),

                        const Icon(
                          Icons.store,
                          size: 25,
                        ),

                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Take at Shop",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Collect your order from our shop",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Text(
                          "FREE",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(),

                  // COURIER OPTION
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedDelivery = "courier";
                      });
                    },
                    child: Row(
                      children: [

                        Radio<String>(
                          value: "courier",
                          activeColor: const Color(0xFF0284C7),
                          groupValue: selectedDelivery,
                          onChanged: (value) {
                            setState(() {
                              selectedDelivery = value!;
                            });
                          },
                        ),

                        const Icon(
                          Icons.delivery_dining,
                          size: 25,
                        ),

                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Courier Delivery",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Have your order delivered to you",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const Text(
                          "MK 2,100",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                                  child:Image.asset("assets/images/airtel2.jpg",height: 90,width: 90,fit:BoxFit.fill,)),
                              SizedBox(width: 70),
                              Text("Airtel money",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
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
                                  child:Image.asset("assets/images/tnm.jpg",height: 90,width: 90,fit:BoxFit.fill,)),
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
                                  child:Image.asset("assets/images/nb.png",height: 90,width: 90,fit:BoxFit.fill,)),
                              SizedBox(width: 70),
                              Text("National bank",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                            ],

                          )
                      ),




                    ])

                )



            )]
    ))));
  }
}

