import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:perfume_store_mo/pages/navbarmenu.dart';
import 'package:perfume_store_mo/pages/profiledetails.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProState();
}

class _ProState extends State<Profile> {
  Map<String, dynamic> user = {};
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Navbarmenu(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          actionsIconTheme: const IconThemeData(color: Colors.blueGrey),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : errorMessage.isNotEmpty
                ? Center(child: Text(errorMessage))
                : Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Profiledetails()));
                                    },
                                    child: Container(
                                        margin:
                                            const EdgeInsets.only(left: 350),
                                        child: const Icon(Icons.edit_outlined)),
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            minRadius: 45,
                                            maxRadius: 50,
                                            child: ClipOval(
                                                child: Image.network(
                                              user['profileUrl'] ??
                                                  "default_image_url",
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ))),
                                        const SizedBox(width: 15),
                                        Text(
                                          '${user['firstName'] ?? "Unknown"} ${user['lastName'] ?? "User"}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          padding: const EdgeInsets.all(10),
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
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(
                                            255, 255, 255, 255),
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 2,
                                                color: Colors.black))),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.wysiwyg),
                                        SizedBox(width: 10),
                                        Text(
                                          "My Purchase",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        SizedBox(width: 50),
                                        Text(
                                          "View Purchase History >",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 200),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ));
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.perfumestorev2.somee.com/api/v1/user/8a9a6e9c-7a12-4033-8e67-83010438b701'));

      if (response.statusCode == 200) {
        setState(() {
          user = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load user data: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }
}