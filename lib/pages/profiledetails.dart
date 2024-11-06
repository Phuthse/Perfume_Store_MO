import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/profile.dart';

class Profiledetails extends StatefulWidget {
  const Profiledetails({super.key});

  @override
  State<Profiledetails> createState() => _ProfiledetailsState();
}

class _ProfiledetailsState extends State<Profiledetails> {
  Map<String, dynamic>? userData;
  File? _image;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      uploadImage(File(pickedFile.path));
    }
  }

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse(
        'https://www.perfumestorev2.somee.com/api/v1/user/8a9a6e9c-7a12-4033-8e67-83010438b701'));

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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Bottomnav()));
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
                  MaterialPageRoute(builder: (context) => const Bottomnav()));
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
                            border: const Border(
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
                                  child: _image != null
                                      ? Image.file(
                                          _image!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          userData!['profileUrl'],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              Container(
                                child: IconButton(
                                  onPressed: pickImage,
                                  icon: const Icon(Icons.camera_alt),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildProfileDetail(
                      "Name",
                      '${userData!['firstName'] ?? 'No'} ${userData!['lastName'] ?? 'Name'}',
                      context),
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
                  buildProfileDetail(
                      "Profile Url",
                      userData!['profileUrl']?.isNotEmpty ?? false
                          ? userData!['profileUrl']
                          : 'Add photo by URL',
                      context),
                  const SizedBox(height: 10),
                ],
              ),
            ),
    );
  }

  Widget buildProfileDetail(String title, String value, BuildContext context) {
    String displayValue = value;
    if (title == "Profile Url") {
      displayValue = value.length > 30 ? value.substring(0, 30) + '...' : value;
    }

    bool isEditable = title != "Name" && title != "Email";

    return Container(
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
      margin: const EdgeInsets.only(left: 17, right: 17, top: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: const Border(bottom: BorderSide(width: 1, color: Colors.black)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          GestureDetector(
            onTap: isEditable
                ? () {
                    showEditBottomSheet(title.toLowerCase(), value);
                  }
                : null,
            child: Text(
              "$displayValue >",
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  void showEditBottomSheet(String field, String currentValue) {
    final controller = TextEditingController(text: currentValue);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Edit $field", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              TextField(
                controller: controller,
                decoration: InputDecoration(hintText: "Enter new $field"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      final newValue = controller.text;
                      if (newValue.isNotEmpty && newValue != currentValue) {
                        updateUserData(field, newValue);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> uploadImage(File image) async {
    final request = http.MultipartRequest(
      'PUT',
      Uri.parse(
          'https://www.perfumestorev2.somee.com/api/v1/users/8a9a6e9c-7a12-4033-8e67-83010438b701'),
    );

    request.files
        .add(await http.MultipartFile.fromPath('profileUrl', image.path));
    request.headers['Content-Type'] = 'multipart/form-data';
    final response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile image updated successfully')),
      );
      fetchUserData();
    } else {
      final responseBody = await response.stream.bytesToString();
      print('Failed to upload image. Status code: ${response.statusCode}');
      print('Response body: $responseBody');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $responseBody')),
      );
    }
  }

  bool isUpdating = false;
  Future<void> updateUserData(String field, String newValue) async {
    setState(() {
      isUpdating = true;
    });

    try {
      final response = await http.put(
        Uri.parse(
            'https://www.perfumestorev2.somee.com/api/v1/users/8a9a6e9c-7a12-4033-8e67-83010438b701'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({field: newValue}),
      );

      if (response.statusCode == 200) {
        setState(() {
          userData![field] = newValue;
        });
        await fetchUserData();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User data updated successfully')),
        );
      } else {
        throw Exception('Failed to update user data');
      }
    } catch (e) {
      print('Error when updating user data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update user data: $e')),
      );
    } finally {
      setState(() {
        isUpdating = false;
      });
    }
  }
}
