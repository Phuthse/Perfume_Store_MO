import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/cart.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Details extends StatefulWidget {
  final Map<String, dynamic> perfume; // Nhận dữ liệu nước hoa từ API

  const Details({Key? key, required this.perfume}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int q = 1; // số lượng tối thiểu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 65.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Image.network(
                widget.perfume['imageUrl'] ?? '', // URL ảnh từ API
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.perfume['name'] ?? 'No name', // Tên sản phẩm từ API
              style: AppWidget.boldText(),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.perfume['description'] ??
                  'No description available', // Mô tả từ API
              style: AppWidget.lightText(),
            ),
            const SizedBox(height: 20.0),
            Text(
              "\$${widget.perfume['price'] ?? 'N/A'}", // Giá từ API
              style: AppWidget.boldText(),
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: const EdgeInsets.only(right: 100.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (q > 1) {
                        setState(() {
                          q--;
                        });
                      }
                    },
                    child: const Icon(Icons.remove, color: Colors.black),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(q.toString(), style: AppWidget.boldText()),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        q++;
                      });
                    },
                    child: const Icon(Icons.add, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 53, 53, 53),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: Text(
                      "${widget.perfume['volume'] ?? 'N/A'}ml", // Dung tích từ API
                      style: AppWidget.whiteText(),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 214, 212, 212),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    child: Text(
                      widget.perfume['releaseYear']
                          .toString(), // Năm phát hành từ API
                      style: AppWidget.whiteText(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Cart()),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 150),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text("Add To Cart", style: AppWidget.whiteText()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
