import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                          left: 100, right: 100, bottom: 10),
                      child: const Text("Shipping Options"),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(96, 210, 209, 209),
                    border: Border(
                        left: BorderSide(
                            color: Color.fromARGB(95, 233, 157, 201),
                            width: 5))),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: const Icon(Icons.money),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: const Text(
                                    "Cash on Delivery",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 630.0),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 231, 228, 228)),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 18),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(95, 233, 157, 201),
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 20, left: 150, right: 150),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
