import 'dart:async';
import 'package:dummy/ui/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:dummy/ui/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashServices
{
  void isLogin(BuildContext context)
  {

    final auth=FirebaseAuth.instance;

    final user=auth.currentUser;

    if(user!=null)
    {
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>post_screen()));

       });
    }
    else{
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

       });

    }
    
  }
  
}