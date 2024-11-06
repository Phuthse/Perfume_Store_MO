import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:perfume_store_mo/admin/editcategory.dart';

class Viewcategory extends StatefulWidget {
  const Viewcategory({super.key});

  @override
  State<Viewcategory> createState() => _ViewcategoryState();
}

class _ViewcategoryState extends State<Viewcategory> {
  List<dynamic> categories = [];
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Categories'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return ListTile(
                      title: Text('${index + 1}. ${category['categoryName']}'),
                      subtitle: Text('Category ID: ${category['categoryId']}'),
                      onTap: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Editcategory(
                              categoryId: category['categoryId'],
                              initialCategoryName: category['categoryName'],
                            ),
                          ),
                        ).then((_) {
                          
                          fetchCategoryData();
                        });
                      },
                    );
                  },
                ),
    );
  }

  Future<void> fetchCategoryData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.perfumestorev2.somee.com/api/v1/GetCategory/all'));

      if (response.statusCode == 200) {
        setState(() {
          categories = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load category data: ${response.statusCode}';
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