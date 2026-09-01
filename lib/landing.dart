import 'package:flutter/material.dart';
class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MtongaMart",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          //IconButton(onPressed: (){}, icon: Icon(Icons.search))
         // ,
        ],
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.black,
        elevation: 5,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,

        elevation:10,

        child: Column(
          children: [
            DrawerHeader(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo2.png',
                    width: 130,
                    height: 80,
                  ),

                   SizedBox(height: 8),

                  Text(
                    'MtongaMart',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: IconButton(onPressed: (){}, icon: Icon(Icons.home,size: 30,)),
              title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
              onTap: (){Navigator.pop(context);},
            ),

            ListTile(
              leading: IconButton(onPressed: (){}, icon: Icon(Icons.info,size: 30,)),
              title: Text("About",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
              onTap: (){Navigator.pop(context);},
            ),

            ListTile(
              leading: IconButton(onPressed: (){}, icon: Icon(Icons.settings,size: 30,)),
              title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
              onTap: (){Navigator.pop(context);},
            )
        ]
        ),
      ),
      body:SingleChildScrollView(
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
                      Icons.shopping_bag,
                      color: Colors.grey,
                      size: 50,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Bags",
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
                      Icons.phone_android,
                      color: Colors.grey,
                      size: 50,
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Phones",
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
                color:Colors.grey,
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
                      color:Colors.grey,
                    )
                ),
                child: Column(

                    children: [
                      Image.asset("assets/images/logo.jpg",
                        height: 180,width: double.infinity,
                        fit:BoxFit.cover,),
                      Padding(
                          padding: EdgeInsets.only(top:10,left: 15,right: 10),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("apple airpods",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              Row(
                                children: [
                                  Icon(Icons.star_border,color: Colors.orange,size: 20,),
                                  SizedBox(width: 5,),
                                  Text("4.5 (24)",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.grey),),
                                ],
                              ),
                              Text("MK 150,320",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,)),
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
                          color:Colors.grey,
                        )
                    ),
                    child: Column(

                        children: [
                          Image.asset("assets/images/avon.jpg",
                            height: 180,width: double.infinity,
                            fit:BoxFit.cover,),
                          Padding(
                              padding: EdgeInsets.only(top:10,left: 15,right: 10),
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("iphone 12 (256GB)",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
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
                          color:Colors.grey,
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
                      color:Colors.grey,
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
                      color:Colors.grey,
                    )
                ),
                child: Column(

                    children: [
                      Image.asset("assets/images/avon.jpg",
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
              ),)
            ],
          )])
          //////////////////////end
      ],
      ))),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.lightBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,

          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.category_sharp),label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile")
          ]

      )
    );
  }
}
