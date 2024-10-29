import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/profile.dart';

class Profiledetails extends StatefulWidget {
  const Profiledetails({super.key});

  @override
  State<Profiledetails> createState() => _ProfiledetailsState();
}

class _ProfiledetailsState extends State<Profiledetails> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse(
        'http://www.perfumestore.somee.com/api/v1/user/8a9a6e9c-7a12-4033-8e67-83010438b701'));

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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bottomnav()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Bottomnav()));
            },
            icon: const Icon(Icons.done_outlined),
          ),
        ],
      ),
      body: userData == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, left: 145, right: 145),
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.black)),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              CircleAvatar(
                                minRadius: 45,
                                maxRadius: 50,
                                child: ClipOval(
                                  child: Image.asset(
                                    'images/avt1.jfif', // Giữ nguyên hình ảnh mặc định test 123
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.camera_alt)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildProfileDetail(
                      "Name", userData!['firstName'] ?? 'No Name', context),
                  const SizedBox(height: 10),
                  buildProfileDetail(
                      "Email", userData!['email'] ?? 'No Email', context),
                  const SizedBox(height: 10),
                  buildProfileDetail(
                      "Phone",
                      userData!['phone']?.isNotEmpty ?? false
                          ? userData!['phone']
                          : 'Add Phone',
                      context),
                  const SizedBox(height: 10),
                  buildProfileDetail(
                      "Address",
                      userData!['address']?.isNotEmpty ?? false
                          ? userData!['address']
                          : 'Add Address',
                      context),
                ],
              ),
            ),
    );
  }

  Widget buildProfileDetail(String title, String value, BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
      margin: const EdgeInsets.only(left: 17, right: 17, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border(bottom: BorderSide(width: 1, color: Colors.black)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: () {
              // Thêm logic chỉnh sửa thông tin tại đây
            },
            child: Text(value + " >", style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
