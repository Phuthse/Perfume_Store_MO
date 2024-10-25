import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/login.dart';
import 'package:perfume_store_mo/pages/register.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Forgotpas extends StatefulWidget {
  const Forgotpas({super.key});

  @override
  State<Forgotpas> createState() => _ForgotpasState();
}

class _ForgotpasState extends State<Forgotpas> {
  TextEditingController emailcontroller = new TextEditingController();

  String email = "";
  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Password Recovery has been sent!",
        style: TextStyle(fontSize: 18),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No User found for that Email",
          style: TextStyle(fontSize: 18),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LogIn()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 50.0),
            Container(
              alignment: Alignment.topCenter,
              child: Text("Password Recovery", style: AppWidget.boldText()),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter your email",
              style: AppWidget.lightText(),
            ),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
                child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListView(
                        children: [
                          Container(
                            padding:
                                EdgeInsets.only(left: 10, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              controller: emailcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please provide your email!';
                                }
                                return null;
                              },
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontSize: 18, color: Colors.black),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  email = emailcontroller.text;
                                });
                              }
                              resetPassword();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LogIn()));
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 200,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Send Email",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account? "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()));
                                },
                                child: Container(
                                    child: Text(
                                  "Register Now",
                                  style: AppWidget.pinkText(),
                                )),
                              ),
                            ],
                          ))
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
