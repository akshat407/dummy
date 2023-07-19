import 'package:dummy/ui/login_phone.dart';
import 'package:dummy/ui/post_screen.dart';
import 'package:dummy/ui/signup.dart';
import 'package:dummy/utils.dart';
import 'package:dummy/widgets/round_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text,
            password: passwordcontroller.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });

      utils().toastmessege(value.user!.email.toString());

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => post_screen()));
    }).onError((error, stackTrace) {
      debugPrint(error.toString());

      utils().toastmessege(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading:
              false, //login ke bagal wala back button gayab ho jayega
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailcontroller,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.alternate_email)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: Icon(Icons.lock_outlined)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  )),
              RoundButton(
                abc: 'Login',
                loading: loading,
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              SizedBox(height: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: Text('Sign Up'))
                ],
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>login_phone()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                   border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(child: Text('Login with Phone Number')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
