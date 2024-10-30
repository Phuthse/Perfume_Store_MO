import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:perfume_store_mo/admin/adminlogin.dart';
import 'package:perfume_store_mo/model/perfume.dart';
import 'package:perfume_store_mo/network/network_perfume_request.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/cart.dart';
import 'package:perfume_store_mo/pages/login.dart';
import 'package:perfume_store_mo/pages/profile.dart';
import 'package:perfume_store_mo/pages/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: StreamBuilder<User?>(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasError) {
      //       return Text(snapshot.error.toString());
      //     }

      //     if (snapshot.connectionState == ConnectionState.active) {
      //       if (snapshot.data == null) {
      //         return LogIn();
      //       } else {
      //         return Bottomnav();
      //       }
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),
      home: Bottomnav(),
    );
  }
}
