import 'package:flutter/material.dart';
import 'cards/category_card.dart';
import 'models/category.dart';
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
            SizedBox(
              height: 320,
              width: double.infinity,
              child: CategoryCard(
                category: categories[0],
              ),
            ),

            SizedBox(height: 10,),
          ///////////////////////////////////////
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),

              itemCount: categories.length - 1,

              itemBuilder: (context, index) {

                // index starts from 0
                // but we want to start from category number 1
                final category = categories[index + 1];

                return CategoryCard(
                  category: category,
                );
              },
            ),

          ],
        ),

    ));
  }
}
