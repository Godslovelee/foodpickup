///GoodBytz take Home assesment
///Description:
///Created by:

import 'package:flutter/material.dart';
import 'package:food_pickup_app/screens/splash_screen.dart';

import 'package:provider/provider.dart';

import 'model/box_element_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
      ),
    );
  }
}