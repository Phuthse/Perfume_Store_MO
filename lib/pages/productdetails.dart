import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:perfume_store_mo/model/perfume.dart';
import 'package:perfume_store_mo/pages/cart.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';
import 'package:http/http.dart' as http;

class Productdetails extends StatefulWidget {
  final Perfume product;

  const Productdetails({super.key, required this.product});

  @override
  _ProductdetailsState createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  int quantity = 1;
  
  bool isFavorite = false;

   Future<void> addToCart(String userId, String perfumeId, int quantity) async {
  final String apiUrl = 'https://perfumestorev2.somee.com/api/v1/add-to-cart?userId=8a9a6e9c-7a12-4033-8e67-83010438b701&quantity=1';  // Thay bằng URL API của bạn
  
  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'userid': userId,
        'perfumeid': perfumeId,  // Dùng đúng ID của sản phẩm
        'quantity': quantity,
      }),
    );

    // Kiểm tra trạng thái phản hồi và nội dung
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");

    if (response.statusCode == 200) {
      // Nếu yêu cầu thành công, thông báo cho người dùng
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added to cart successfully!')),
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Cart())); // Chuyển sang trang giỏ hàng
    } else {
      // Nếu có lỗi, thông báo lỗi từ API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add to cart. Status Code: ${response.statusCode}, Body: ${response.body}')),
      );
    }
  } catch (e) {
    // Xử lý lỗi nếu có (lỗi mạng, cấu hình sai, v.v.)
    print("Error occurred: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred. Please try again later.')),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "${widget.product.imageUrl}",
                fit: BoxFit.fill,
                width: 500,
                height: 400,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${widget.product.name}", style: const TextStyle(fontSize: 22)),
              const SizedBox(
                height: 5,
              ),
              Text("${widget.product.brand}", style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 5,
              ),
              Text("Release Year: ${widget.product.releaseYear}",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 5,
              ),
              Text("${widget.product.volume}" " ml",
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(
                height: 5,
              ),
              Text("${widget.product.description}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
              const SizedBox(
                height: 10,
              ),
              Text("\$${widget.product.price}",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(right: 100.0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (quantity > 1) {
                            quantity--;
                          }
                          setState(() {});
                        },
                        child: Container(
                            child:
                                const Icon(Icons.remove, color: Colors.black))),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(quantity.toString(), style: AppWidget.boldText()),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          quantity++;
                          setState(() {});
                        },
                        child: Container(
                            child: const Icon(Icons.add, color: Colors.black))),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                 onTap: () {
                  String userId = '8a9a6e9c-7a12-4033-8e67-83010438b701'; 
                  String? perfumeId = widget.product.perfumeId;
                  addToCart(userId, perfumeId!, quantity); 
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 23),
                  padding: const EdgeInsets.only(
                      left: 130, top: 15, bottom: 15, right: 130),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(5.0),
                        topRight: const Radius.circular(15.0),
                        bottomLeft: const Radius.circular(15.0),
                        bottomRight: const Radius.circular(5.0),
                      )),
                  child: Text("Add To Cart", style: AppWidget.whiteText()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
