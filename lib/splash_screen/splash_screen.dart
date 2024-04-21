// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:tution_master/slection_loginscreen/selection_loginscreen.dart';
import 'package:tution_master/utils/colors_constants.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Selectionuserscreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.mainblack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 350,
                width: 350,
                child: Image.asset(
                    "assets/images/tution-master-high-resolution-logo.png")),
            SizedBox(
              height: 0,
            ),
            CircularProgressIndicator(
              color: Colorconstant.maingrey,
            )
          ],
        ),
      ),
    );
  }
}
