import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class Activitydetails extends StatefulWidget {
  final String perfumeId; // Nhận perfumeId từ màn hình trước

  const Activitydetails({super.key, required this.perfumeId});

  @override
  State<Activitydetails> createState() => _ActivitydetailsState();
}

class _ActivitydetailsState extends State<Activitydetails> {
  Map<String, dynamic>? perfumeData; // Dữ liệu chi tiết nước hoa

  @override
  void initState() {
    super.initState();
    fetchPerfumeDetails(); // Gọi hàm lấy chi tiết nước hoa khi khởi tạo
  }

  Future<void> fetchPerfumeDetails() async {
    final response = await http.get(Uri.parse(
        'https://www.perfumestorev2.somee.com/perfume/${widget.perfumeId}'));

    if (response.statusCode == 200) {
      setState(() {
        perfumeData = json.decode(response.body); // Lưu dữ liệu vào perfumeData
      });
    } else {
      throw Exception('Failed to load perfume details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: perfumeData == null
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.only(top: 65.0, left: 10.0, right: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 80),
                        const Text(
                          "Reviews & Ratings",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Container(
                      margin: const EdgeInsets.only(left: 53, right: 55),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 3))),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text(
                                  perfumeData!['name'] ?? "No Name",
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      "${perfumeData!['volume']} ml",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(width: 100),
                                    Text(
                                      "\$${perfumeData!['price']}",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Image.network(
                                  perfumeData!['imageUrl'] ?? "",
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "4.8",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              children: [
                                buildRatingRow("5", 0.9),
                                buildRatingRow("4", 0.8),
                                buildRatingRow("3", 0.1),
                                buildRatingRow("2", 0.05),
                                buildRatingRow("1", 0.02),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 0.01,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(113, 246, 160, 210),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const Text(" 1,230 reviews"),
                    ),
                    const SizedBox(height: 20),
                    buildUserReview(
                      context,
                      "John Doe",
                      "This is one of my favorite perfumes, it has a gentle scent suitable for dates.",
                      "01/10/2024",
                      4.5,
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Widget buildRatingRow(String label, double value) {
    return Row(
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: Colors.grey,
              valueColor: const AlwaysStoppedAnimation(
                  Color.fromARGB(113, 246, 160, 210)),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildUserReview(BuildContext context, String userName,
      String reviewText, String date, double rating) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("images/user.png"),
              ),
              const SizedBox(width: 20),
              Text(
                userName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            children: [
              RatingBar.builder(
                initialRating: rating,
                minRating: 0.01,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Color.fromARGB(113, 246, 160, 210),
                ),
                onRatingUpdate: (newRating) {
                  print(newRating);
                },
              ),
              const SizedBox(width: 25),
              Text(date),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Text(reviewText),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
