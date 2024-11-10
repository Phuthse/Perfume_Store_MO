import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/checkout.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<dynamic>? cartData;  // Sửa thành List để chứa danh sách các items trong giỏ hàng
  Map<String, dynamic>? perfumeDetails; // Chi tiết của từng sản phẩm

  @override
  void initState() {
    super.initState();
    fetchCartData();
  }

  // API lấy giỏ hàng của người dùng
  Future<void> fetchCartData() async {
    final String userId = '8a9a6e9c-7a12-4033-8e67-83010438b701';  // Thay bằng ID người dùng thực tế
    final response = await http.get(Uri.parse(
        'https://perfumestorev2.somee.com/api/v1/8a9a6e9c-7a12-4033-8e67-83010438b701'));

    if (response.statusCode == 200) {
      setState(() {
        cartData = json.decode(response.body);  // Lưu trữ dữ liệu giỏ hàng dưới dạng List
      });
      // Sau khi nhận được cartData, lấy thông tin chi tiết cho từng sản phẩm
      await fetchPerfumesDetails();
    } else {
      throw Exception('Failed to load cart data');
    }
  }

  // API lấy chi tiết sản phẩm theo perfumeId
  Future<void> fetchPerfumesDetails() async {
    if (cartData != null) {
      // Lấy thông tin chi tiết của từng sản phẩm trong giỏ hàng
      for (var item in cartData!) {
        final perfumeId = item['perfumeId'];
        final response = await http.get(Uri.parse(
            'https://perfumestorev2.somee.com/perfume/$perfumeId'));

        if (response.statusCode == 200) {
          setState(() {
            if (perfumeDetails == null) {
              perfumeDetails = {};  // Khởi tạo nếu chưa có
            }
            perfumeDetails![perfumeId] = json.decode(response.body);
          });
        } else {
          throw Exception('Failed to load perfume details');
        }
      }
    }
  }

  @override
Widget build(BuildContext context) {
  double total = 0.0;
  // Tính tổng tiền giỏ hàng
  if (cartData != null) {
    total = cartData!.fold(0.0, (sum, item) {
      final perfume = perfumeDetails?[item['perfumeId']];
      return sum + (perfume?['price'] ?? 0) * (item['quantity'] ?? 0);
    });
  }

  return Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      children: <Widget>[
        // Header với nút quay lại
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
                        builder: (context) => const Bottomnav()),
                  );
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

        // Hiển thị giỏ hàng nếu có
        Expanded(  // Sử dụng Expanded để phần giỏ hàng chiếm hết không gian còn lại
          child: cartData != null
              ? ListView.builder(
                  itemCount: cartData!.length,
                  itemBuilder: (context, index) {
                    final item = cartData![index];
                    final perfumeId = item['perfumeId'];
                    final perfume = perfumeDetails?[perfumeId];
                    if (perfume == null) {
                      return const Center(child: CircularProgressIndicator()); // Chờ dữ liệu chi tiết sản phẩm
                    }
                    return Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromARGB(95, 233, 157, 201),
                                  width: 3))),
                      child: Row(
                        children: [
                          // Hiển thị hình ảnh sản phẩm
                          Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Image.network(
                              perfume['imageUrl'],
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 8,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Tên sản phẩm
                                Text(
                                  perfume['name'],
                                  style: const TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                // Thông tin về dung tích và số lượng
                                Text(
                                  "Volume: ${perfume['volume']} ml",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Quantity: ${item['quantity']}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 5),
                                // Hiển thị giá của sản phẩm
                                Text(
                                  "Price: \$${perfume['price'].toStringAsFixed(2)}",  // Giá sản phẩm
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                // Tính giá tiền cho mỗi sản phẩm (giá * số lượng)
                                Text(
                                  "Total: \$${(perfume['price'] * item['quantity']).toStringAsFixed(2)}", // Tổng giá sản phẩm (price * quantity)
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
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        ),

        // Thanh checkout ở dưới cùng
        Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 242, 240, 240),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.only(left: 10, right: 10),
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
                "\$${total.toStringAsFixed(2)}",  // Tổng giá của tất cả sản phẩm trong giỏ hàng
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
                    "Check Out (${cartData != null ? cartData!.length : 0})",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
}