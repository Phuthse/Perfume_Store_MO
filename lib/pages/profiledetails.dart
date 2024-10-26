import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/profile.dart';

class Profiledetails extends StatefulWidget {
  const Profiledetails({super.key});

  @override
  State<Profiledetails> createState() => _ProfiledetailsState();
}

class _ProfiledetailsState extends State<Profiledetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Bottomnav()));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bottomnav()));
              },
              icon: Icon(Icons.done_outlined))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 145, right: 145),
                    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.black))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
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
                        Container(
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.camera_alt)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
              margin: EdgeInsets.only(left: 17, right: 17, top: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Tran Hoang Phu (K17 HCM)" + " >", style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
              margin: EdgeInsets.only(left: 17, right: 17, top: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Email", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Phuthse170221@fpt.edu.vn", style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
              margin: EdgeInsets.only(left: 17, right: 17, top: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("0123456789" + " >", style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding:EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
              margin: EdgeInsets.only(left: 17, right: 17, top: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("321, 9 District, Ho Chi Minh" + " >", style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            
          ],
        ),
      ),
    );
  }
}
