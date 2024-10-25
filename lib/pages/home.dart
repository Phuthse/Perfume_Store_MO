import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:perfume_store_mo/pages/bestseller.dart';
import 'package:perfume_store_mo/pages/details.dart';
import 'package:perfume_store_mo/pages/justarrived.dart';
import 'package:perfume_store_mo/pages/navbarmenu.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbarmenu(),
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.blueGrey),
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.search, color: Colors.black,)
        ],
        // actions: [
        //   IconButton(
        //       onPressed: () async {
        //         await GoogleSignIn().signOut();
        //         FirebaseAuth.instance.signOut();
        //         Navigator.pop(context);
        //       },
        //       icon: const Icon(Icons.logout)),
        // ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Sellers",
                    style: AppWidget.headLineText(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Bestseller()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 54, 52, 52),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "see all>",
                        style: AppWidget.whiteText(),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "The Best Perfume Ever",
                style: AppWidget.lightText(),
              ),
              const SizedBox(height: 25.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Details()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("BVLGARI Rose Goldea"),
                                const SizedBox(height: 5.0),
                                Text(
                                  "50ml",
                                  style: AppWidget.lightText(),
                                ),
                                Image.asset("images/BVLGARI-Rose-Goldea.jpg",
                                    height: 170, width: 170, fit: BoxFit.cover),
                                const SizedBox(height: 10.0),
                                Text(
                                  "\$225",
                                  style: AppWidget.lightText(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Chopard Happy Bigaradia"),
                              const SizedBox(height: 5.0),
                              Text(
                                "50ml",
                                style: AppWidget.lightText(),
                              ),
                              Image.asset("images/Chopard-Happy-Bigaradia.jpg",
                                  height: 170, width: 170, fit: BoxFit.cover),
                              const SizedBox(height: 10.0),
                              Text(
                                "\$249",
                                style: AppWidget.lightText(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Just Arrived",
                    style: AppWidget.headLineText(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Justarrived()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 54, 52, 52),
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        "see all>",
                        style: AppWidget.whiteText(),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Recently Arrived Perfumes",
                style: AppWidget.lightText(),
              ),
              const SizedBox(height: 25.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Lancome Idol Idole Nectar"),
                              const SizedBox(height: 5.0),
                              Text(
                                "50ml",
                                style: AppWidget.lightText(),
                              ),
                              Image.asset(
                                  "images/lancome_idole_eau_de_parfum_nectar_.png",
                                  height: 170,
                                  width: 170,
                                  fit: BoxFit.cover),
                              const SizedBox(height: 10.0),
                              Text(
                                "\$225",
                                style: AppWidget.lightText(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Container(
                      margin: const EdgeInsets.all(5.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Christian Dior Happy Hour"),
                              const SizedBox(height: 5.0),
                              Text(
                                "50ml",
                                style: AppWidget.lightText(),
                              ),
                              Image.asset(
                                  "images/CHRISTIAN-DIOR-Happy-Hour.png",
                                  height: 170,
                                  width: 170,
                                  fit: BoxFit.cover),
                              const SizedBox(height: 10.0),
                              Text(
                                "\$249",
                                style: AppWidget.lightText(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
