import 'package:flutter/material.dart';
import 'models/product.dart';
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
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),

            itemCount: products.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.55,
            ),

            itemBuilder: (context, index) {

              final product = products[index];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.lightBlue,
                  ),
                ),

                child: Column(
                  children: [

                    Image.asset(
                      product.image,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                        left: 15,
                        right: 10,
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Row(
                            children: [

                              Icon(
                                Icons.star_border,
                                color: Colors.orange,
                                size: 20,
                              ),

                              SizedBox(width: 5),

                              Text(
                                "${product.rating} (${product.reviews})",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            "MK ${product.price}",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            height: 45,

                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),

                            child: Center(
                              child: Text(
                                "Add",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )

      ],
      )));
  }
}
