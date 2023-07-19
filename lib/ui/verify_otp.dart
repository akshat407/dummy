import 'package:flutter/material.dart';

class verify_otp extends StatefulWidget {
  final String verificationId;
  const verify_otp({super.key, required  this.verificationId});

  @override
  State<verify_otp> createState() => _verify_otpState();
}

class _verify_otpState extends State<verify_otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('verify'),
        centerTitle: true,
      ),
      body: Container(
        
      ),
    );
  }
}