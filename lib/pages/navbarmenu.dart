import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/login.dart';
import 'package:perfume_store_mo/pages/notification.dart';

class Navbarmenu extends StatefulWidget {
  const Navbarmenu({super.key});

  @override
  State<Navbarmenu> createState() => _NavbarmenuState();
}

class _NavbarmenuState extends State<Navbarmenu> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse(
        'https://perfumestorev2.somee.com/api/v1/user/8a9a6e9c-7a12-4033-8e67-83010438b701'));
    if (response.statusCode == 200) {
      setState(() {
        userData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              '${userData?['firstName'] ?? 'Loading...'} ${userData?['lastName'] ?? ''}',
            ),
            accountEmail: Text(userData?['email'] ?? 'Loading...'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: userData != null && userData!['profileUrl'] != null
                    ? FadeInImage.assetNetwork(
                        placeholder: 'images/user.png', 
                        image: userData!['profileUrl'],
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'images/user.png', 
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'images/user.png', 
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage("images/bgpf.jfif"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Exit"),
            onTap: () async {
              await GoogleSignIn().signOut();
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LogIn()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_add),
            title: const Text("Notification Test"),
            onTap: () async {
            
            },
          ),
        ],
      ),
    );
  }
}