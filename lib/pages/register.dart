import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/login.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "", password = "";

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Registered Successfully!",
        style: TextStyle(fontSize: 20.0),
      )));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Bottomnav()));
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Password Provided is too weak",
          style: TextStyle(fontSize: 18.0),
        )));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Account already exist",
          style: TextStyle(fontSize: 18.0),
        )));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Email address is wrong formatted",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        )));
      }
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Container(
            //set background image for login here
            /*decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/lg.png"),
              fit: BoxFit.cover,
            ),
          ),*/
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Register",
                      style: AppWidget.boldText(),
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter your email",
                        prefixIcon: Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter your password",
                        prefixIcon: Icon(Icons.password_outlined)),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          email = emailcontroller.text;
                          password = passwordcontroller.text;
                        });
                      }
                      registration();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: const EdgeInsets.only(
                          left: 148, right: 148, top: 15, bottom: 15),
                      child: Text("Register", style: AppWidget.whiteText()),
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 60),
                      child: Row(
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LogIn()));
                            },
                            child: Container(
                                child: Text(
                              "Login Now",
                              style: AppWidget.pinkText(),
                            )),
                          ),
                        ],
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
