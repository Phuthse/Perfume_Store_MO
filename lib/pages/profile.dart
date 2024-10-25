import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:perfume_store_mo/model/user.dart';

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
      appBar: AppBar(
        title: const Text("Test API"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            final name = user.firstName;
            final role = user.role;
            return ListTile(
              title: Text(name!),
              subtitle: Text(email!),
              
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }

  void fetchUsers() async {
    print("fetch users called");
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final Transformed = results.map((e){
      return User(
        firstName: e['firstName'],
        email: e['email'],
        phone: e['phone'],
      );
      }).toList();
    setState(() {
      users = Transformed;
    });
    print("fetch users complete");
  }
}
