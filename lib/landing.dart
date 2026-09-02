import 'package:flutter/material.dart';
class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Padding(
        padding: EdgeInsets.only(top:13,left: 13,right: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search for products",
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.tune),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
            ),
          ),
          SizedBox(height: 10,),
          Text("Shop by Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Icon(
                      Icons.home_repair_service,
                      color: Colors.grey,
                      size: 50,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Shoes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Icon(
                      Icons.local_grocery_store,
                      color: Colors.grey,
                      size: 50,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Groceries",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Icon(
                      Icons.checkroom,
                      color: Colors.grey,
                      size: 50,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Clothes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Column(
                  children: [
                    Icon(
                      Icons.devices,
                      color: Colors.grey,
                      size: 50,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Electronics",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Featured products",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25)),
              Text("see all >",style: TextStyle(fontWeight: FontWeight(500),fontSize: 25))
            ]
          ),
          SizedBox(height: 10,),
          ///////////////start
         Column(
            children: [
          Row(
            children: [
              Expanded(child:
          Container(
            height:320,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color:Colors.lightBlue,
              )
            ),
            child: Column(

              children: [
                Image.asset("assets/images/iphone.jpg",
                height: 180,width: double.infinity,
                fit:BoxFit.cover,),
                Padding(
                  padding: EdgeInsets.only(top:10,left: 15,right: 10),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("iphone 12 pro max",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                Row(
                  children: [
                    Icon(Icons.star_border,color: Colors.orange,size: 20,),
                    SizedBox(width: 5,),
                    Text("4.5 (24)",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                  ],
                ),
                Text("MK 150,000",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
                    Container(
                      width: double.infinity,
                      height: 45,

                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),

                      child: Center(
                        child: Text(
                          " Add",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],)
            ),
          ]),
          ),),
              SizedBox(width: 10,),
              Expanded(child:
              Container(
                height:320,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:Colors.lightBlue,
                    )
                ),
                child: Column(

                    children: [
                      Image.asset("assets/images/Ps5.jpg",
                        height: 180,width: double.infinity,
                        fit:BoxFit.cover,),
                      Padding(
                          padding: EdgeInsets.only(top:10,left: 15,right: 10),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("PS5 slime",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              Row(
                                children: [
                                  Icon(Icons.star_border,color: Colors.orange,size: 20,),
                                  SizedBox(width: 5,),
                                  Text("2.5 ",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                                ],
                              ),
                              Text("MK 790,000",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
                              Container(
                                width: double.infinity,
                                height: 45,

                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: Center(
                                  child: Text(
                                    " Add",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],)
                      ),
                    ]),
              ),)
            ],
          ),
        ///////////////////////////////////////start
              Row(
                children: [
                  Expanded(child:
                  Container(
                    height:320,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:Colors.lightBlue,
                        )
                    ),
                    child: Column(

                        children: [
                          Image.asset("assets/images/samsung.jpg",
                            height: 180,width: double.infinity,
                            fit:BoxFit.cover,),
                          Padding(
                              padding: EdgeInsets.only(top:10,left: 15,right: 10),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("samsung g s26)",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  Row(
                                    children: [
                                      Icon(Icons.star_border,color: Colors.orange,size: 20,),
                                      SizedBox(width: 5,),
                                      Text("4.5 (24)",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                                    ],
                                  ),
                                  Text("MK 150,000",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
                                  Container(
                                    width: double.infinity,
                                    height: 45,

                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),

                                    child: Center(
                                      child: Text(
                                        " Add",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],)
                          ),
                        ]),
                  ),),
                  SizedBox(width: 10,),
                  Expanded(child:
                  Container(
                    height:320,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color:Colors.lightBlue,
                        )
                    ),
                    child: Column(

                        children: [
                          Image.asset("assets/images/mic.jpg",
                            height: 180,width: double.infinity,
                            fit:BoxFit.cover,),
                          Padding(
                              padding: EdgeInsets.only(top:10,left: 15,right: 10),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("microfone 12 pro",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                  Row(
                                    children: [
                                      Icon(Icons.star_border,color: Colors.orange,size: 20,),
                                      SizedBox(width: 5,),
                                      Text("4.5 (24)",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                                    ],
                                  ),
                                  Text("MK 45,000",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
                                  Container(
                                    width: double.infinity,
                                    height: 45,

                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),

                                    child: Center(
                                      child: Text(
                                        " Add",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],)
                          ),
                        ]),
                  ),)
                ],
              ),
        ////////////////////////////////////////end

          Row(
            children: [
              Expanded(child:
              Container(
                height:320,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:Colors.lightBlue,
                    )
                ),
                child: Column(

                    children: [
                      Image.asset("assets/images/macbook.jpg",
                        height: 180,width: double.infinity,
                        fit:BoxFit.cover,),
                      Padding(
                          padding: EdgeInsets.only(top:10,left: 15,right: 10),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("macbook v12 pro",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              Row(
                                children: [
                                  Icon(Icons.star_border,color: Colors.orange,size: 20,),
                                  SizedBox(width: 5,),
                                  Text("4.5 (24)",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                                ],
                              ),
                              Text("MK 1,150,000",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
                              Container(
                                width: double.infinity,
                                height: 45,

                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: Center(
                                  child: Text(
                                    " Add",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],)
                      ),
                    ]),
              ),),
              SizedBox(width: 10,),
              Expanded(child:
              Container(
                height:320,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:Colors.lightBlue,
                    )
                ),
                child: Column(

                    children: [
                      Image.asset("assets/images/mouse.jpg",
                        height: 180,width: double.infinity,
                        fit:BoxFit.cover,),
                      Padding(
                          padding: EdgeInsets.only(top:10,left: 15,right: 10),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("wireless mouse",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              Row(
                                children: [
                                  Icon(Icons.star_border,color: Colors.orange,size: 20,),
                                  SizedBox(width: 5,),
                                  Text("2.9 (60)",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                                ],
                              ),
                              Text("MK 18,000",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
                              Container(
                                width: double.infinity,
                                height: 45,

                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),

                                child: Center(
                                  child: Text(
                                    " Add",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],)
                      ),
                    ]),
              ),)
            ],
          )])
          //////////////////////end
      ],
      )));
  }
}
