import 'package:flutter/material.dart';
import 'package:perfume_store_mo/pages/cart.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  int q = 1; //minimum quantity
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 65.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Image.asset(
                "images/BVLGARI-Rose-Goldea.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5 ,
                fit: BoxFit.fill,
                
              ),
            ),
            const SizedBox(height: 20.0),

            //hard code
            Text("BVLGARI Rose Goldea", style: AppWidget.boldText(),textAlign: TextAlign.left,),
            const SizedBox(height: 20.0),
            Text("With its exckusive olfactory notes and its precious golden bottle, RoSa Goldea embodys the essence of femininity.", style: AppWidget.lightText() ),
            const SizedBox(height: 20.0),
            Text("\$225", style: AppWidget.boldText()),
            const SizedBox(height: 20.0),
                
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
                                              child: const Icon(Icons.remove,
                                                  color: Colors.black))),
                                      
                                      SizedBox(width: 10,),
                                      Container(
                                        padding: EdgeInsets.only(left: 20, right: 20),
                                        decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(25)),
                                        child: Text(q.toString(),
                                            style: AppWidget.boldText()),
                                      ),
                                      SizedBox(width: 10,),
                                      GestureDetector(
                                          onTap: () {
                                            q++;
                                            setState(() {});
                                          },
                                          child: Container(
                                              child: const Icon(Icons.add,
                                                  color: Colors.black))),
                                    ],
                                  ),
            ),
            const SizedBox(height: 20.0),

            Container(
              
              child:Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 53, 53, 53), borderRadius: BorderRadius.circular(13.0)),
                    child: Text("50ml", style: AppWidget.whiteText()),
                  ),
                  const SizedBox(width: 15.0),
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(color: const Color.fromARGB(255, 214, 212, 212), borderRadius: BorderRadius.circular(13.0)),
                    child: Text("100ml",style: AppWidget.whiteText()),
                  )
              
            ],) ),
            const SizedBox(height: 35.0),

            GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
                    },
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.only(left: 150, top: 20, bottom: 20, right: 150),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15.0)),
              child: Text("Add To Cart", style: AppWidget.whiteText()),
            ),
            )
                
        ],
        ),
      )
    );
  }
}