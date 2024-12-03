import 'package:flutter/material.dart';

import 'package:ukl_2024/homescreen.dart';
import 'package:ukl_2024/regist.dart';
import 'package:ukl_2024/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => Splashscreen(),
        '/regist': (context) => Registscreen(),
        '/home': (context)=> Homescreen(),
      },
    );
  }
}

