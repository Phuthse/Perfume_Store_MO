import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:perfume_store_mo/admin/adminlogin.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/firebaseapi.dart';
import 'package:perfume_store_mo/pages/login.dart';
import 'package:perfume_store_mo/pages/notification.dart';


final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebaseapi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfume Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: navigatorKey,
      //home: LogIn(),
      routes: {
        NotificationScreen.route: (context) => const NotificationScreen()
      },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            
            return Center(child: Text('Error: ${snapshot.error}'));
          }

         
          if (snapshot.data == null) {
           
            return const LogIn(); 
          } else {
            
            return const Bottomnav(); 
          }
        },
      ),
    );
  }
}