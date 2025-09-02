
import 'dart:async';

import 'package:pet_care/ui/welcome_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WelcomeScreen();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      
      child: SvgPicture.asset("assets/images/Loader.svg",fit: BoxFit.cover,),
     ),
    );
  }
}
