import 'dart:convert'; // Để giải mã dữ liệu JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Viewusers extends StatefulWidget {
  @override
  _ViewusersState createState() => _ViewusersState();
}

class _ViewusersState extends State<Viewusers> {

  List<dynamic> users = [];
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    fetchUsers(); 
  }


  Future<void> fetchUsers() async {
    final response = await http.get(
      Uri.parse('https://www.perfumestorev2.somee.com/api/v1/users/admin'),  
    );

    if (response.statusCode == 200) {

      setState(() {
        users = json.decode(response.body); 
        isLoading = false; 
      });
    } else {
      
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Users'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) 
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index]; 
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('${user['firstName']} ${user['lastName']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User ID: ${user['userId']}'),
                        Text('Email: ${user['email']}'),
                        Text('Phone: ${user['phone']}'),
                        Text('Address: ${user['address'] ?? 'N/A'}'),
                        Text('Created At: ${user['createdAt']}'),
                        Text('Last Login: ${user['lastLogin']}'),
                        Text('Updated At: ${user['updatedAt']}'),
                      ],
                    ),
                    onTap: () {

                    },
                  ),
                );
              },
            ),
    );
  }
}