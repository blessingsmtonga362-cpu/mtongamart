import 'package:flutter/material.dart';
import 'package:mtongamart/landingscreen.dart';
import 'landing.dart';

void main(){
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landingscreen(),
    );
  }
}
