import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Center(
                child: Image(
                  image: AssetImage('images/splash_pic.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Align(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                'Top Headlines', textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25,
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Center(
            child:
          ),
        ],
      ),
    );
  }
}

