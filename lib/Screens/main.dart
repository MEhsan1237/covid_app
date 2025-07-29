import 'package:commerce_app/Pages/Cart_Page.dart';
import 'package:commerce_app/Pages/Shop_Page.dart';
import 'package:commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Components/theme.dart';
import 'Pages/Intro_Page.dart';

void main()
{

  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
        routes: {
        '/Intro_Page': (context)=> IntroPage(),
          '/Shop_Page': (context) => ShopPage(),
          '/Cart_Page': (context)=> CartPage(),
        },

    );
  }
}
