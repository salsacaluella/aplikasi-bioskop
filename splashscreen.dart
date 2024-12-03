import 'dart:async';

import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  @override
  SplashscreenState createState() => SplashscreenState();
}

class SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/regist');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF041C3B), //warna bg
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
        Image.asset('assets/splashtix.png', width: 250, height: 250),
        SizedBox(height: 20,),
        Text('Gabung TIX VIP Sekarang!', style: TextStyle(fontSize: 24, color: Colors.white),),
      ],),),
    );
  }
}


