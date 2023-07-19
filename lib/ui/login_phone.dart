import 'package:dummy/ui/verify_otp.dart';
import 'package:dummy/utils.dart';
import 'package:dummy/widgets/round_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login_phone extends StatefulWidget {
  const login_phone({super.key});

  @override
  State<login_phone> createState() => _login_phoneState();
}

class _login_phoneState extends State<login_phone> {
  bool loading = false;

  final phonecontroller = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login with phone number'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(children: [
          TextFormField(
            controller: phonecontroller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: '+91XXXXXXX'),
          ),
          SizedBox(
            height: 30,
          ),
          RoundButton(
              abc: 'Submit',
              loading: loading,
              ontap: () {
                setState(() {
                  loading:true;
                  true;
                });
                auth.verifyPhoneNumber(
                    phoneNumber: phonecontroller.text,
                    verificationCompleted: (_) {
                      setState(() {
                        loading:true;
                        false;
                      });
                    },
                    verificationFailed: (e) {
                      utils().toastmessege(e.toString());
                      setState(() {
                        loading:false;
                        false;
                      });
                    },
                    codeSent: (String verificationId, int? token) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => verify_otp(
                                    verificationId: verificationId,
                                  )));
                      setState(() {
                        loading:false;
                        false;
                        
                      });
                    },
                    codeAutoRetrievalTimeout: (e) {
                      utils().toastmessege(e.toString());
                      setState(() {
                        loading:false;
                        false;
                      });
                    });
              })
        ]),
      ),
    );
  }
}
