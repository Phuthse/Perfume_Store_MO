import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:perfume_store_mo/pages/start.dart';

import 'package:sign_in_button/sign_in_button.dart';

class LogInGoogle extends StatefulWidget {
  const LogInGoogle({super.key});

  @override
  State<LogInGoogle> createState() => _LogInGoogleState();
}

class _LogInGoogleState extends State<LogInGoogle> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Start()));
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: _user != null ? _userInfo() : _googleSignInButton(),
    );
  }

  Widget _googleSignInButton() {
    return Center(
      child: SizedBox(
        height: 50,
        child: SignInButton(
          Buttons.google,
          text: "Sign up with Google",
          onPressed: _handleGoogleSignIn,
        ),
      ),
    );
  }

  Widget _userInfo() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(_user!.photoURL!))),
          ),
          Text(_user!.email!),
          MaterialButton(
            onPressed: _auth.signOut,
            child: const Text("Log Out"),
          ),
        ],
      ),
    );
  }

  void _handleGoogleSignIn() {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(googleAuthProvider);
    } catch (error) {
      print(error);
    }
  }
}
