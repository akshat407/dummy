import 'package:dummy/Firebase_services/Splash_services.dart';
import 'package:dummy/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


SplashServices splashServices=SplashServices();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/bigbuddy.png'), 
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.black54,
      );
  }
}