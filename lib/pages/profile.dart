import 'package:flutter/material.dart';
import 'package:perfume_store_mo/model/user.dart';
import 'package:perfume_store_mo/pages/bestseller.dart';
import 'package:perfume_store_mo/pages/productdetails.dart';
import 'package:perfume_store_mo/pages/justarrived.dart';
import 'package:perfume_store_mo/pages/navbarmenu.dart';
import 'package:perfume_store_mo/pages/profiledetails.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProState();
}

class _ProState extends State<Profile> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navbarmenu(),
        appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.blueGrey),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Profiledetails()));
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 350),
                              child: Icon(Icons.edit_outlined)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              CircleAvatar(
                                  minRadius: 45,
                                  maxRadius: 50,
                                  child: ClipOval(
                                      child: Image.asset(
                                    "images/avt1.jfif",
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ))),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Tran Hoang Phu (K17 HCM)",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 60),
                            child: Icon(Icons.camera_alt)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.black))),
                          child: Row(
                            children: [
                              Container(
                                child: Icon(Icons.wysiwyg),
                              ),
                              Text(
                                "My Purchase",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Container(
                                child: Text(
                                  "View Purchase History>",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
