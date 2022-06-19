import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:al_quran/Screens/Login/components/background.dart';
import 'package:al_quran/Screens/Signup/signup_screen.dart';
import 'package:al_quran/Screens/Welcom/welcome_screen.dart';
import 'package:al_quran/components/already_have_an_account_acheck.dart';
import 'package:al_quran/components/rounded_button.dart';
import 'package:al_quran/components/rounded_input_field.dart';
import 'package:al_quran/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:al_quran/Screens/Pages/screens/nav_screen.dart';

import '../../../model/usermodel.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;
  final _formkey = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;
  QuerySnapshot <Map<String, dynamic>> snapshotUserInfo ;
  DatabaseMethod databaseMethod = new DatabaseMethod();
  final  _auth = FirebaseAuth.instance;

  @override
  void initState(){
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }


  @override

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height:10),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Sign in to continue.",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: emailcontroller,
                    validator: validateEmail,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(errorMessage),
                  ),

                  SizedBox(height: 30),
                  TextFormField(
                    obscureText: true,
                    controller: passwordcontroller,
                    validator: validatePassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.vpn_key),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  MaterialButton(onPressed: () async{
                    setState(() => isLoading = true);
                    if(_formkey.currentState.validate()) {

                      print("email: ${emailcontroller.text}");
                      print("password: ${passwordcontroller.text}");

                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text);


                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return NavScreen();
                          },),);
                        errorMessage = '';
                      } on FirebaseAuthException catch (error) {
                        errorMessage = error.message;

                      }
                      setState(() => isLoading = false);
                    }
                  },//material button
                    height: 70,
                    minWidth: double.infinity,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: isLoading? CircularProgressIndicator(color: Colors.white) :Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: true,
                    press: () {Navigator.push(context, MaterialPageRoute(builder: (context){return SignUpScreen();},),);},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



//check email empty and the format
String validateEmail(String formEmail){
  if(formEmail == null || formEmail.isEmpty)
    return 'E-mail address is required!';

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format!';

  return null;
}

//check password and must be a strong password

String validatePassword(String formPassword){
  if(formPassword == null || formPassword.isEmpty)
    return 'Password is required!';

  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''Password must be at least 8 characters,
  include an uppercase letter, number and symbol!''';

  return null;
}


