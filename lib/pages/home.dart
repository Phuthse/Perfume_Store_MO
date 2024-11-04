import 'package:flutter/material.dart';
import 'package:perfume_store_mo/model/perfume.dart';
import 'package:perfume_store_mo/network/network_perfume_request.dart';
import 'package:perfume_store_mo/pages/bestseller.dart';
import 'package:perfume_store_mo/pages/productdetails.dart';
import 'package:perfume_store_mo/pages/justarrived.dart';
import 'package:perfume_store_mo/pages/navbarmenu.dart';
import 'package:perfume_store_mo/pages/search.dart';
import 'package:perfume_store_mo/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Perfume> perfumeData = <Perfume>[];

  @override
  void initState() {
    super.initState();
    NetworkPerfumeRequest.fetchPerfumes().then((dataFromSever) {
      setState(() {
        perfumeData = dataFromSever;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbarmenu(),
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.blueGrey),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Search()));
          }, icon: const Icon(Icons.search)),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 5.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Best Sellers",
                    style: AppWidget.headLineText(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Bestseller()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 54, 52, 52),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(5.0),
                            topRight: const Radius.circular(15.0),
                            bottomLeft: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(5.0),
                          )),
                      child: Text(
                        "see all>",
                        style: AppWidget.whiteText(),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "The Best Perfume Ever",
                style: AppWidget.lightText(),
              ),
              const SizedBox(height: 25.0),
              Container(
                padding: const EdgeInsets.only(
                    top: 15, bottom: 5, right: 5),
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: perfumeData.length,
                  itemBuilder: (context, index) {
                    final product = perfumeData[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Productdetails(product: product),
                          ),
                        );
                      },
                      child: Container(
                        width: 199,
                        margin: const EdgeInsets.only(right: 5),
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${perfumeData[index].name}'),
                                const SizedBox(
                                  height: 5,
                                ),
                                Image.network('${perfumeData[index].imageUrl}'),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${perfumeData[index].volume}' " ml",
                                ),
                                Text(
                                  "\$" '${perfumeData[index].price}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Just Arrived",
                    style: AppWidget.headLineText(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Justarrived()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 54, 52, 52),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(5.0),
                            topRight: const Radius.circular(15.0),
                            bottomLeft: const Radius.circular(15.0),
                            bottomRight: const Radius.circular(5.0),
                          )),
                      child: Text(
                        "see all>",
                        style: AppWidget.whiteText(),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Recently Arrived Perfumes",
                style: AppWidget.lightText(),
              ),
              const SizedBox(height: 25.0),
              Container(
                padding: const EdgeInsets.all(5),
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: perfumeData.length,
                  itemBuilder: (context, index) {
                    final product = perfumeData[index];

                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Productdetails(product: product),
                            ),
                          );
                        },
                        child: Container(
                          width: 200,
                          margin: const EdgeInsets.only(
                              right: 5), // Khoảng cách giữa các item
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${perfumeData[index].name}'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Image.network(
                                      '${perfumeData[index].imageUrl}'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text("Release Year: " '${perfumeData[index].releaseYear}'),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "\$" '${perfumeData[index].price}',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
