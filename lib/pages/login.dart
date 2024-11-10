import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/forgotpas.dart';
import 'package:perfume_store_mo/pages/home.dart';
import 'package:perfume_store_mo/pages/register.dart';
import 'package:perfume_store_mo/pages/start.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = "", password = "";
  final _formkey = GlobalKey<FormState>();

  TextEditingController useremailcontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Bottomnav()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Email address is wrong formatted",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Wrong Email or Password, please try again",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Start()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/start.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(32),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Text(
                      "Welcome!",
                      style: AppWidget.boldText(),
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                    TextFormField(
                      controller: useremailcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: userpasswordcontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.password_outlined)),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Forgotpas()));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 225),
                          child: Text("Forgot Password?",
                              style: AppWidget.lightText())),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          setState(() {
                            email = useremailcontroller.text;
                            password = userpasswordcontroller.text;
                          });
                        }
                        userLogin();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10.0),
                            border: const Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 1))),
                        padding: const EdgeInsets.only(
                            left: 140, right: 140, top: 15, bottom: 15),
                        child: Text("Sign In", style: AppWidget.whiteText()),
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    Container(
                      child: const Text("OR",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        child: SignInButton(
                      Buttons.google,
                      text: "Sign in with Google",
                      onPressed: () {
                        signInWithGoogle();
                      },
                    )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const SizedBox(
                      height: 80.0,
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 60),
                        child: Row(
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
              )),
        ),
      ),
    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  bool _isSigningIn = false;
  
  Future<void> signInWithGoogle() async {
    setState(() {
      _isSigningIn = true;
    });

    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        setState(() {
          _isSigningIn = false;
        });
        print("User canceled the sign-in process.");
        return;
      }

      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        String? idToken = await user.getIdToken();

        print("User signed in: ${user.displayName}");
        print("ID Token: $idToken");

        await _saveToken(idToken!);
        await verifyTokenOnBackend(idToken);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bottomnav()),
        );
      }
    } catch (e) {
      print("Google sign-in error: $e");
    } finally {
      setState(() {
        _isSigningIn = false;
      });
    }
  }

  Future<void> _saveToken(String idToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('idToken', idToken);
  }

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('idToken');
  }

  Future<void> verifyTokenOnBackend(String? idToken) async {
    String? idToken = await _getToken();

    if (idToken == null) {
      print("No ID token found to send to backend.");
      return;
    }

    final url = 'https://perfumestorev2.somee.com/api/Auth/verify-token';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $idToken',
        },
      );

      if (response.statusCode == 200) {
        print('Token verification successful: ${response.body}');
      } else {
        print('Token verification failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during token verification: $e');
    }
  }

  // signInWithGoogle() async {
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   if (googleUser == null) {
  //     print("User canceled the sign-in process.");
  //     return;
  //   }

  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //   //String? idToken = googleAuth?.idToken;

  //   AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   print(userCredential.user?.displayName);
  //   print(userCredential.user?.email);

  //   if (userCredential.user != null) {
  //     //_saveToken(idToken!);
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => const Bottomnav()));
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(
  //       "Sign in as ${userCredential.user!.displayName!}",
  //       style: const TextStyle(fontSize: 18.0, color: Colors.white),
  //     )));
  //   }
  // }
}
