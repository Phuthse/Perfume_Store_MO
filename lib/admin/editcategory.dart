import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Editcategory extends StatefulWidget {
  final String categoryId;
  final String initialCategoryName;

  Editcategory({
    required this.categoryId,
    required this.initialCategoryName,
  });

  @override
  _EditcategoryState createState() => _EditcategoryState();
}

class _EditcategoryState extends State<Editcategory> {
  late TextEditingController _categoryNameController;

  @override
  void initState() {
    super.initState();
    _categoryNameController = TextEditingController(text: widget.initialCategoryName);
  }

  
  Future<void> updateCategory() async {
    final String categoryName = _categoryNameController.text;

    final response = await http.put(
      Uri.parse('https://www.perfumestorev2.somee.com/api/v1/UpdatePerfume/${widget.categoryId}'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'categoryName': categoryName,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Category updated successfully')),
      );
      Navigator.pop(context);  
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update category')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _categoryNameController,
              decoration: InputDecoration(labelText: 'Category Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateCategory,
              child: Text('Update Category'),
            ),
          ],
        ),
      ),
    );
  }
}