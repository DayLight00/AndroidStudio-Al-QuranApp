import 'package:flutter/material.dart';
import 'package:al_quran/Screens/Login/login_screen.dart';
import 'package:al_quran/Screens/Signup/components/background.dart';
import 'package:al_quran/Screens/Signup/components/or_divider.dart';
import 'package:al_quran/Screens/Signup/components/social_icon.dart';
import 'package:al_quran/Screens/Welcom/welcome_screen.dart';
import 'package:al_quran/components/already_have_an_account_acheck.dart';
import 'package:al_quran/components/rounded_button.dart';
import 'package:al_quran/components/rounded_input_field.dart';
import 'package:al_quran/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:al_quran/Screens/Pages/screens/nav_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:al_quran/model/usermodel.dart';
import 'package:fluttertoast/fluttertoast.dart';





class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  TextEditingController _emailcontroller;
  TextEditingController _passwordcontroller;

  final _formkey = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;
  final  _auth = FirebaseAuth.instance;

  @override
  void initState(){
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();

    super.initState();
  }

  @override
  void dispose(){
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();

  }

  DropdownMenuItem<String> buildMenuItem(String item)=> DropdownMenuItem(
    value: item,
    child: Text(
      item, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );

  @override
  Widget build(BuildContext context) {
  User user = FirebaseAuth.instance.currentUser;

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
  "assets/icons/signup.svg",
  height: size.height * 0.35,
  ),
  SizedBox(height:10),
  Text(
  "Sign Up Now!",
  style: TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.bold, color: Colors.black
  ),
  ),
  SizedBox(height: 10),
  Text(
  "Fill All Form Below!",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
  ),
//ENTER NICKNAME

//ENTER NAME

//SELECT COURSE CODE


//SELECT ROLE


//ENTER EMAIL
  SizedBox(height: 30),
  TextFormField(
  controller: _emailcontroller,
  validator: validateEmail,
  decoration: InputDecoration(
  hintText: "Email",
  prefixIcon: Icon(Icons.mail),
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  ),
  ),
  ),

  Padding(
  padding: EdgeInsets.all(1.2),
  child: Center(
  child: Text(errorMessage, style: TextStyle(color: Colors.red),),
  ),
  ),
//ENTER PASSWORD
  SizedBox(height: 30),
  TextFormField(
  obscureText: true,
  controller: _passwordcontroller,
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
                  TextFormField(
                    controller: _passwordcontroller,
                    validator: (value) => (value==null || value.length <6 ) ? "Password must be 6 characters long!" : null,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.vpn_key),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
//SIGNUP BUTTON
  SizedBox(height: 30),
  MaterialButton(onPressed: () async {
  setState(() {
  isLoading = true;
  errorMessage = '';
  });

  if(_formkey.currentState.validate()) {
  print("email: ${_emailcontroller.text}");
  print("password: ${_passwordcontroller.text}");

  try {

  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
  email: _emailcontroller.text,
  password: _passwordcontroller.text).then(
  (value)=> {
  postDataToFireStore()
  });

  Navigator.push(context,
  MaterialPageRoute(builder: (context) {
  return LoginScreen();
  },),);

  } on FirebaseAuthException catch (error) {
  errorMessage = error.message;
  }
  setState(() => isLoading = false);
  }
  //Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();},),);
  },

  child: isLoading? CircularProgressIndicator(color: Colors.white) :Text(
  "Sign Up",
  style: TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  ),
  ),

  height: 70,
  minWidth: double.infinity,
  color: Theme.of(context).primaryColor,
  textColor: Colors.white,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20),
  ),
  ),



//BUTTON FOR CHECK IF ALREADY HAS ACCOUNT OR NOT
  SizedBox(height: size.height * 0.03),
  AlreadyHaveAnAccountCheck(
  login: false,
  press: () {Navigator.push(context, MaterialPageRoute(builder: (context){return LoginScreen();},),);},

  ),
  ],
  ),
  ),
  ),

  ),
  ),

  );

  }

//FUNCTION TO INTERACT WITH FIRESTORE
  postDataToFireStore() async {

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  User user = _auth.currentUser;

  UserModel userModel = UserModel();

  //writing the values
  userModel.email = user.email;
  userModel.uid = user.uid;


  await firebaseFireStore
      .collection("user")
      .doc(user.uid)
      .set(userModel.toMap());
  Fluttertoast.showToast(msg: "Account created successfully!");
  }

  }

//FUNCTION TO VALIDATE EMAIL,NAME AND PASSWORD
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