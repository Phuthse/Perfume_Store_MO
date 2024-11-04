import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Activitydetails extends StatefulWidget {
  const Activitydetails({super.key});

  @override
  State<Activitydetails> createState() => _ActivitydetailsState();
}

class _ActivitydetailsState extends State<Activitydetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 65.0, left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
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
                    const SizedBox(
                      width: 80,
                    ),
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      child: const Text(
                        "Reviews & Ratings",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin: const EdgeInsets.only(top: 30, left: 53, right: 55),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 3))),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 10, bottom: 10),
                              child: Column(
                                children: [
                                  Container(
                                    child: const Text(
                                      "BVLGARI Rose Goldea",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                            child: const Text(
                                          "50ml",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w300),
                                        )),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        Container(
                                            child: const Text("\$229",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w300))),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(15.0),
                                    child: Image.asset(
                                      "images/BVLGARI-Rose-Goldea.jpg",
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Text(
                            "4.8",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "5",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.5,
                                        child: LinearProgressIndicator(
                                          value: 0.9,
                                          minHeight: 11,
                                          backgroundColor: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          valueColor: const AlwaysStoppedAnimation(
                                              Color.fromARGB(
                                                  113, 246, 160, 210)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "4",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.5,
                                        child: LinearProgressIndicator(
                                          value: 0.8,
                                          minHeight: 11,
                                          backgroundColor: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          valueColor: const AlwaysStoppedAnimation(
                                              Color.fromARGB(
                                                  113, 246, 160, 210)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "3",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.5,
                                        child: LinearProgressIndicator(
                                          value: 0.1,
                                          minHeight: 11,
                                          backgroundColor: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          valueColor: const AlwaysStoppedAnimation(
                                              Color.fromARGB(
                                                  113, 246, 160, 210)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "2",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: (MediaQuery.of(context)
                                                .size
                                                .width) *
                                            0.5,
                                        child: LinearProgressIndicator(
                                          value: 0.05,
                                          minHeight: 11,
                                          backgroundColor: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          valueColor: const AlwaysStoppedAnimation(
                                              Color.fromARGB(
                                                  113, 246, 160, 210)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "1",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width:
                                            (MediaQuery.of(context).size.width),
                                        child: LinearProgressIndicator(
                                          value: 0.02,
                                          minHeight: 11,
                                          backgroundColor: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          valueColor: const AlwaysStoppedAnimation(
                                              Color.fromARGB(
                                                  113, 246, 160, 210)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
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
                      child: const Text(" 1,230")),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage("images/user.png"),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "John Doe",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        children: [
                          Container(
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
                          const SizedBox(width: 25,),
                          Container(child: const Text("01/10/2024"),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: const Text("This is one of my favorite perfumes, it has a gentle scent suitable for dates."),
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
