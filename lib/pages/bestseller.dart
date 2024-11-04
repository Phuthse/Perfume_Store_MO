import 'package:flutter/material.dart';
import 'package:perfume_store_mo/model/perfume.dart';
import 'package:perfume_store_mo/network/network_perfume_request.dart';
import 'package:perfume_store_mo/pages/productdetails.dart';

class Bestseller extends StatefulWidget {
  const Bestseller({super.key});

  @override
  State<Bestseller> createState() => _BestsellerState();
}

class _BestsellerState extends State<Bestseller> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Best Sellers",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text(
              "The Best Perfume Ever",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            childAspectRatio: 0.7, // Adjust as needed
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: perfumeData.length,
          itemBuilder: (context, index) {
            final product = perfumeData[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Productdetails(product: product)));
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(15.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${perfumeData[index].name}'),
                        const SizedBox(height: 5.0),
                        Expanded(
                          child: Image.network(
                            '${perfumeData[index].imageUrl}',
                            fit: BoxFit.cover,
                            height: 150,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          '${perfumeData[index].volume}' " ml",
                        ),
                        const SizedBox(height: 5.0),
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
    );
  }
}
