import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Viewperfumes extends StatefulWidget {
  @override
  _ViewperfumesState createState() => _ViewperfumesState();
}

class _ViewperfumesState extends State<Viewperfumes> {
  List<dynamic> perfumes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPerfumes();
  }

  Future<void> fetchPerfumes() async {
    final response = await http.get(
      Uri.parse('https://www.perfumestorev2.somee.com/api/v1/perfumes'),
    );

    if (response.statusCode == 200) {
      setState(() {
        perfumes = json.decode(response.body);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load perfumes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfume List'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: perfumes.length,
              itemBuilder: (context, index) {
                final perfume = perfumes[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      perfume['imageUrl'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(perfume['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Brand: ${perfume['brand']}'),
                        Text('Scent: ${perfume['scent']}'),
                        Text('Price: \$${perfume['price']}'),
                        Text('Stock Quantity: ${perfume['stockQuantity']}'),
                        Text('Gender: ${perfume['gender']}'),
                        Text('Origin: ${perfume['origin']}'),
                        Text('Release Year: ${perfume['releaseYear']}'),
                        Text('Volume: ${perfume['volume']} ml'),
                        Text('Discount: ${perfume['discount']}%'),
                        Text('Top Note: ${perfume['topNote']}'),
                        Text('Middle Note: ${perfume['middleNote']}'),
                        Text('Base Note: ${perfume['baseNote']}'),
                        Text('View Count: ${perfume['viewCount']}'),
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
    );
  }
}
