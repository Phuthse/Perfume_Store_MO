import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:perfume_store_mo/model/perfume.dart';
import 'package:perfume_store_mo/network/network_request.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/cart.dart';
import 'package:perfume_store_mo/pages/login.dart';
import 'package:perfume_store_mo/pages/profile.dart';
import 'package:perfume_store_mo/pages/start.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const MyApp());
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
      //         return Profile();
      //       }
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),

      home: Bottomnav(),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Perfume> perfumeData = <Perfume>[];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchPerfumes().then((dataFromSever) {
      setState(() {
        perfumeData = dataFromSever;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Request"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: perfumeData.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${perfumeData[index].name}'),
                      Text('${perfumeData[index].brand}'),
                      Text('${perfumeData[index].price}'),
                      Text('${perfumeData[index].description}'),
                      Text('${perfumeData[index].releaseYear}'),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
