import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:perfume_store_mo/pages/activitydetails.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List<dynamic> perfumes = []; 

  @override
  void initState() {
    super.initState();
    fetchPerfumes(); 
  }

  Future<void> fetchPerfumes() async {
    final response = await http.get(Uri.parse(
        'https://perfumestorev2.somee.com/api/v1/perfumes?page=1&pageSize=10'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        perfumes = data;
      });
    } else {
      throw Exception('Failed to load perfumes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 65.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(height: 25.0),
            Container(
              margin: const EdgeInsets.only(left: 140),
              child: Text(
                "Activity Log",
                style: AppWidget.headLineText(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 60),
              child: Text(
                "Click on product to see User Reviews",
                style: AppWidget.lightText(),
              ),
            ),
            const SizedBox(height: 25.0),
            perfumes.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, 
                        childAspectRatio: 0.7, 
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10, 
                      ),
                      itemCount: perfumes.length,
                      itemBuilder: (context, index) {
                        final perfume = perfumes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Activitydetails(
                                  perfumeId: perfume['perfumeId'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            child: Material(
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(perfume['name'] ?? "No Name"),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      "${perfume['volume']}ml",
                                      style: AppWidget.lightText(),
                                    ),
                                    Image.network(
                                      perfume['imageUrl'] ?? "",
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      "\$${perfume['price']}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
