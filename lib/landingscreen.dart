import 'package:flutter/material.dart';
import 'Landing.dart';
import 'cart.dart';
import 'category.dart';
import 'profile.dart';
import '../data/cart_data.dart';

class Landingscreen extends StatefulWidget {
  const Landingscreen({super.key});

  @override
  State<Landingscreen> createState() => _LandingscreenState();
}

class _LandingscreenState extends State<Landingscreen> {
  int currentIndex = 0;

  final List<Widget> screen = [
    Landing(),
    Category(),
    Cart(),
    Profile()
  ];
  void onSelectedItem(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,

          titleSpacing: 20,

          title: const Text(
            "MtongaMart",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),

          actions: [



            // Cart
            ListenableBuilder(
              listenable: cart,
              builder: (context, child) {
                return Stack(
                  children: [

                    IconButton(
                      onPressed: () {
                        onSelectedItem(2);
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 26,
                      ),
                    ),

                    Positioned(
                      right: 6,
                      top: 6,
                      child: Container(
                        height: 18,
                        width: 18,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF43F5E),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "${cart.items.length}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            const SizedBox(width: 8),
          ],
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
                    Image.asset('assets/images/logo2.png',
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
                onTap: (){Navigator.pop(context);
                  onSelectedItem(0);},
              ),
              ListTile(
                leading: IconButton(onPressed: (){}, icon: Icon(Icons.grid_view_sharp,size: 30,)),
                title: Text("Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                onTap: (){Navigator.pop(context);
                onSelectedItem(1);},
              ),
              ListTile(
                leading: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,size: 30,)),
                title: Text("Cart",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                onTap: (){Navigator.pop(context);
                onSelectedItem(2);},
              ),

              ListTile(
               // splashColor: Colors.teal.withOpacity(0.2),
                //hoverColor: Colors.teal.withOpacity(0.1),
                leading: IconButton(onPressed: (){}, icon: Icon(Icons.person,size: 30,)),
                title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),
                onTap: (){Navigator.pop(context);
                onSelectedItem(3);},
              )
            ]
        ),
      ),
        body: screen[currentIndex],



        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index){
              setState(() {
                currentIndex=index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xFF0F172A),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,

            items:[
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined),label: "Category"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Profile")
            ]

        )
    );
  }
}
