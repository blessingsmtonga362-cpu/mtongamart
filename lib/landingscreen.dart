import 'package:flutter/material.dart';
import 'Landing.dart';
import 'cart.dart';
import 'category.dart';
import 'profile.dart';

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
            backgroundColor: Colors.lightBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,

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
