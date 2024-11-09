import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GoogleSignInPage extends StatefulWidget {
  @override
  _GoogleSignInPageState createState() => _GoogleSignInPageState();
}

class _GoogleSignInPageState extends State<GoogleSignInPage> {
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

      
      UserCredential userCredential = await _auth.signInWithCredential(credential);

      
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Sign-In with Firebase"),
      ),
      body: Center(
        child: _isSigningIn
            ? CircularProgressIndicator() // Show loading spinner while signing in
            : ElevatedButton(
                onPressed: signInWithGoogle,
                child: Text("Sign In with Google"),
              ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Welcome to Home Page")),
    );
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

    final url =
        'https://www.perfumestorev2.somee.com/api/Auth/verify-token'; // Replace with your backend URL

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Bearer $idToken', // Add the idToken in Authorization header
        },
      );

      if (response.statusCode == 200) {
        // Token verified successfully
        print('Token verification successful: ${response.body}');
        // Proceed with navigation or any other logic you need
      } else {
        print('Token verification failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during token verification: $e');
    }
  }
