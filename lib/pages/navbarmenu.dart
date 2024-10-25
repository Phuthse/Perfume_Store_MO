import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/login.dart';

class Navbarmenu extends StatefulWidget {
  const Navbarmenu({super.key});

  @override
  State<Navbarmenu> createState() => _NavbarmenuState();
}

class _NavbarmenuState extends State<Navbarmenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Tran Hoang Phu (K17 HCM)"),
            accountEmail: Text("phuthse170221@fpt.edu.vn"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "images/avt1.jfif",
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("images/bgpf.jfif"), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Exit"),
            onTap: () async {
              await GoogleSignIn().signOut();
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));
            },
          ),
        ],
      ),
    );
  }
}
