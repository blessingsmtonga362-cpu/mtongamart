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
            const Text(
              "Shop by Category",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Find exactly what you're looking for.",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 320,
              width: double.infinity,
              child: CategoryCard(
                category: categories[0],
              ),
            ),

            const SizedBox(height: 15),
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
