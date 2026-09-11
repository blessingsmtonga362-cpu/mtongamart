import 'package:flutter/material.dart';
import 'models/product.dart';
import 'cards/product_card.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Featured products",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25)),
              Text("see all >",style: TextStyle(fontWeight: FontWeight(500),fontSize: 25)),
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

              return ProductCard(
                product:product
              );
            },
          )

      ],
      )));
  }
}
