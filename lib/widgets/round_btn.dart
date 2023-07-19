import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String abc;
  final VoidCallback ontap;
  bool loading=false;

   RoundButton({super.key, required this.abc, required this.ontap,this.loading=false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          child: Center(
            child: loading?CircularProgressIndicator(
              color: Colors.white,
            ):Text(abc,style: TextStyle(color: Colors.white),),
          ),
        ),
    );
    
  }
}