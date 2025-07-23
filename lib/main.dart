import 'package:flutter/material.dart';

import 'Screens/splashscreen.dart';


void main()
{
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
            primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
