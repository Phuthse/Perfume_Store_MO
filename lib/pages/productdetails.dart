import 'package:flutter/material.dart';
import 'package:perfume_store_mo/model/perfume.dart';
import 'package:perfume_store_mo/pages/cart.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

// class Productdetails extends StatefulWidget {
//   final dynamic product;
//   Productdetails({required this.product});

//   @override
//   State<Productdetails> createState() => _ProductdetailsState();
// }

// class _ProductdetailsState extends State<Productdetails> {

//   int q = 1; //minimum quantity
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       margin: const EdgeInsets.only(top: 65.0, left: 10.0, right: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(Icons.arrow_back, color: Colors.black),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Name: ${product['name']}",
//                     style: TextStyle(fontSize: 20)),
//                 Text("Brand: ${product['brand']}",
//                     style: TextStyle(fontSize: 18)),
//                 Text("Price: ${product['price']}",
//                     style: TextStyle(fontSize: 18)),
//                 Text("Release Year: ${product['releaseYear']}",
//                     style: TextStyle(fontSize: 18)),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(right: 100.0),
//             child: Row(
//               children: [
//                 GestureDetector(
//                     onTap: () {
//                       if (q > 1) {
//                         q--;
//                       }
//                       setState(() {});
//                     },
//                     child: Container(
//                         child: const Icon(Icons.remove, color: Colors.black))),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 1),
//                       borderRadius: BorderRadius.circular(25)),
//                   child: Text(q.toString(), style: AppWidget.boldText()),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       q++;
//                       setState(() {});
//                     },
//                     child: Container(
//                         child: const Icon(Icons.add, color: Colors.black))),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20.0),
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => const Cart()));
//             },
//             child: Container(
//               margin: const EdgeInsets.only(left: 8),
//               padding: const EdgeInsets.only(
//                   left: 150, top: 20, bottom: 20, right: 150),
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(15.0)),
//               child: Text("Add To Cart", style: AppWidget.whiteText()),
//             ),
//           )
//         ],
//       ),
//     ));
//   }
// }

class Productdetails extends StatefulWidget {
  final Perfume product;

  Productdetails({required this.product});

  @override
  _ProductdetailsState createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  // Khai báo các biến trạng thái nếu cần
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    int q = 1; //quantity
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
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
            Text("${widget.product.name}", style: TextStyle(fontSize: 22)),
            const SizedBox(
              height: 5,
            ),
            Text("${widget.product.brand}",
                style: TextStyle(fontSize: 16)),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            Text("Release Year: ${widget.product.releaseYear}",
                style: TextStyle(fontSize: 16)),
            const SizedBox(
              height: 5,
            ),
            Text("${widget.product.volume}" + " ml",
                style: TextStyle(fontSize: 16)),
            const SizedBox(
              height: 5,
            ),
            Text("${widget.product.description}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 10,
            ),
            Text("\$${widget.product.price}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(right: 100.0),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        if (q > 1) {
                          q--;
                        }
                        setState(() {});
                      },
                      child: Container(
                          child:
                              const Icon(Icons.remove, color: Colors.black))),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(25)),
                    child: Text(q.toString(), style: AppWidget.boldText()),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        q++;
                        setState(() {});
                      },
                      child: Container(
                          child: const Icon(Icons.add, color: Colors.black))),
                  const SizedBox(height: 20.0),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              child: Container(
                margin: const EdgeInsets.only(left: 23),
                padding: const EdgeInsets.only(
                    left: 130, top: 15, bottom: 15, right: 130),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: new Radius.circular(5.0),
                      topRight: new Radius.circular(15.0),
                      bottomLeft: new Radius.circular(15.0),
                      bottomRight: new Radius.circular(5.0),
                    )),
                child: Text("Add To Cart", style: AppWidget.whiteText()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
