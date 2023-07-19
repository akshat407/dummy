import 'package:dummy/ui/login_screen.dart';
import 'package:dummy/utils.dart';
import 'package:dummy/widgets/round_btn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller=TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void login() {
    setState(() {
      loading = true;
    });
    _auth.createUserWithEmailAndPassword(
            email: emailcontroller.text,
            password: passwordcontroller.text.toString())
        .then((value) {
          utils().toastmessege('Signup successfully, now login with this credentials');
      setState(() {
        loading = false;
      });
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
                      keyboardType: TextInputType.text,
                      controller: namecontroller,
                      // obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'abc',
                          prefixIcon: Icon(Icons.person)),
                      
                    ),
                    SizedBox(height: 10,),
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
                abc: 'Sign Up',
                loading: loading,
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                  ;
                }),
            SizedBox(height: 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text('Login Up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
