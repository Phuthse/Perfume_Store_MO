import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/activitydetails.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/productdetails.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 65.0, left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Container(
                    padding: const EdgeInsets.all(4.0),
                    child: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25.0),
              Container(
                margin: EdgeInsets.only(left: 160),
                child: Text(
                  "Activity",
                  style: AppWidget.headLineText(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 60),
                child: Text(
                  "Click on product to see User Reviews",
                  style: AppWidget.lightText(),
                ),
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
                                builder: (context) => const Activitydetails()));
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
                    GestureDetector(
                      onTap: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => const Productdetails()));
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
                                const Text("Chopard Happy Bigaradia"),
                                const SizedBox(height: 5.0),
                                Text(
                                  "50ml",
                                  style: AppWidget.lightText(),
                                ),
                                Image.asset(
                                    "images/Chopard-Happy-Bigaradia.jpg",
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
                    ),
                    const SizedBox(width: 5.0),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Productdetails()));
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
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Productdetails()));
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
                                const Text("Chopard Happy Bigaradia"),
                                const SizedBox(height: 5.0),
                                Text(
                                  "50ml",
                                  style: AppWidget.lightText(),
                                ),
                                Image.asset(
                                    "images/Chopard-Happy-Bigaradia.jpg",
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
