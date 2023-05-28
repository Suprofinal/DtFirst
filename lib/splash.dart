import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled/login.dart';
import 'package:untitled/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState(){
    super.initState();
    setTimer();



  }
 setTimer(){
   var duration=Duration(seconds: 6, milliseconds: 600);
   return Timer(duration, route);

 }
 route(){
   Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, duration: Duration(milliseconds: 450), child: LoginPage(),));

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [



          Positioned(
              width: MediaQuery.of(context).size.width * 3,
            //bottom: 50,
            bottom: 500,
            right: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur (sigmaX: 100, sigmaY: 100,),
            child: SizedBox(),
          ),
          ),

          RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur (sigmaX: 100, sigmaY: 100,),
            child: SizedBox(),
          ),
          ),
          Container(
            alignment: Alignment.center,
            child: Lottie.network("https://assets6.lottiefiles.com/packages/lf20_cnpdG8zmLI.json"),
          ),

        ],


      ),
    );
  }

 }

