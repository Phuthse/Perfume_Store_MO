import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/checkout.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  Map<String, dynamic>? perfumeData;

  @override
  void initState() {
    super.initState();
    fetchPerfumesData();
  }

  Future<void> fetchPerfumesData() async {
    final response = await http.get(Uri.parse(
        'https://www.perfumestorev2.somee.com/perfume/22222222-2222-2222-2222-222222222222'));

    if (response.statusCode == 200) {
      // Giả sử phản hồi trả về là danh sách
      perfumeData = json.decode(response.body);
    } else {
      throw Exception('Failed to load cart data');
    }
  }

  @override
  Widget build(BuildContext context) {
    double total = 0.0;
    if (perfumeData != null && perfumeData!['cartItems'] != null) {
      total = perfumeData!['cartItems'].fold(0, (sum, item) {
        return sum + (item['perfume']['price'] * item['quantity']);
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Header
              Container(
                margin: const EdgeInsets.only(right: 45, top: 65, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Bottomnav()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 3))),
                      padding: const EdgeInsets.only(
                          left: 150, right: 150, bottom: 10),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),

              // Hiển thị các sản phẩm trong giỏ hàng
              if (perfumeData != null && perfumeData!['cartItems'] != null)
                ...perfumeData!['cartItems'].map<Widget>((item) {
                  return Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(95, 233, 157, 201),
                                width: 3))),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15.0),
                          child: Image.network(
                            item['perfume']['imageUrl'],
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 8,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['perfume']
                                    ['name'], // Hiển thị tên nước hoa
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Volume: ${item['perfume']['volume']} ml", // Hiển thị thể tích
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "Quantity: ${item['quantity']}", // Hiển thị số lượng
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "\$${(item['perfume']['price'] * item['quantity']).toStringAsFixed(2)}", // Giá tổng
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList()
              else
                const Center(
                    child:
                        CircularProgressIndicator()), // Hiển thị loading nếu chưa có dữ liệu

              const SizedBox(height: 365.0),

              // Footer
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 240, 240),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Total: ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${total.toStringAsFixed(2)}", // Hiển thị tổng tiền
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Checkout()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(95, 233, 157, 201),
                            borderRadius: BorderRadius.circular(15)),
                        padding: const EdgeInsets.only(
                            top: 23, bottom: 23, left: 25, right: 25),
                        child: Text(
                          "Check Out (${perfumeData != null && perfumeData!['cartItems'] != null ? perfumeData!['cartItems'].length : 0})",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
