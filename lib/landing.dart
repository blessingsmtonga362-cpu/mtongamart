import 'package:flutter/material.dart';
import 'models/product.dart';
import 'cards/product_card.dart';
import 'service/api_service.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final productService = ProductService();
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    loadProducts();

  }
  Future<void> loadProducts() async {
    try{

    final result = await productService.getProducts();
    setState(() {
      products = result;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Products loaded successfully!"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 10),
      ),
    );}
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to load products: $e"),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 10),
        ));
    }

  }
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
                      IconButton(onPressed: (){
                        loadProducts();
                      }, icon: Icon(Icons.refresh))
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

