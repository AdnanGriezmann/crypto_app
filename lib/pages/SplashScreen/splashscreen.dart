import 'dart:async';
import 'package:crypto_app/pages/HomePage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset('images/cryptocurrency.png',
                  height: 70.0.h, width: 70.0.w)),
                  SizedBox(height: 5.h,),
           Text(
            'Crypto APP',
            style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold,fontSize: 15.sp),
          )
        ],
      ),
    );
  }
}
