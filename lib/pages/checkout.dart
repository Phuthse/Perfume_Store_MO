import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/bottomnav.dart';
import 'package:perfume_store_mo/pages/home.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
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
                          left: 120, right: 130, bottom: 5),
                      child: const Text(
                        "Checkout",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
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
                      child: Image.asset(
                        "images/BVLGARI-Rose-Goldea.jpg",
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 8,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("BVLGARI Rose Goldea"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("size: 50ml"),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: const Row(
                              children: [
                                Text(
                                  "\$229.00",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: const Text("Quantity: 2"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                      child: Image.asset(
                        "images/lancome_idole_eau_de_parfum_nectar_.png",
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 8,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Lancome Idol Idole Nectar"),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text("size: 50ml"),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: const Row(
                              children: [
                                Text(
                                  "\$218.00",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: const Text("Quantity: 1"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 115,),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),border: const Border(bottom: BorderSide(color: Colors.black, width: 1))),
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
                                  child: const Icon(Icons.local_shipping),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  child: const Text(
                                    "Shipping Option",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(
                                  width: 147,
                                ),
                                
                              ],
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: const Text(
                                    "Standard Express",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 210,
                                ),
                                Container(
                                  child: const Text(
                                    "\$3>",
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: const Text(
                              "Guaranteed to get by 30/09 - 03/10",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(

                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  
                ),
                padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), border: const Border(bottom: BorderSide(color: Colors.black, width: 1))),
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
                                Container(child: const Text("Payment Option", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
                                const SizedBox(width: 47,),
                                Container(
                                  child: const Text(
                                    "Cash on Delivery>",
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
              Container(

                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 5,
                ),
                padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10), border: const Border(bottom: BorderSide(color: Colors.black, width: 1))),
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
                                    "Payment Details",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text(
                                    "Merchandise Subtotal",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                const SizedBox(width: 130,),
                                Container(
                                  child: const Text(
                                    "\$676.00",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text(
                                    "Shipping Subtotal",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                                const SizedBox(width: 185,),
                                Container(
                                  child: const Text(
                                    "\$3.00",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text(
                                    "Total Payment",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 185,),
                                Container(
                                  child: const Text(
                                    "\$679.00",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
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
              const SizedBox(height: 5.0),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 242, 240, 240),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(10),
                child: Row(
                  
                  children: [
                    Container(
                      child: const Text(
                        "Total: ",
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "\$679.00",
                        style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                    const SizedBox(width: 80,),
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
                        child: const Text(
                          "Place Order",
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
