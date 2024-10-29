import 'package:flutter/material.dart';
import 'package:perfume_store_mo/model/perfume.dart';
import 'package:perfume_store_mo/network/network_perfume_request.dart';
import 'package:perfume_store_mo/pages/productdetails.dart';

class Search extends StatefulWidget {
  const Search({super.key});


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int maxItems = 4;
    final searchcontroller = TextEditingController();
  
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
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children:<Widget> [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: searchcontroller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Perfume name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )
              ),
              onChanged: searchPerfume,
            ),
          ),
          Expanded(
            child: ListView.builder(
            itemCount: perfumeData.length > maxItems ? maxItems : perfumeData.length,
            itemBuilder: (context, index){
              final product = perfumeData[index];
              return ListTile(
                leading: Image.network('${perfumeData[index].imageUrl}', height: 50, width: 50, fit: BoxFit.cover,),
                title: Text('${perfumeData[index].name}'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Productdetails(product: product))),
              );
            },
          )),
        ],
      ),
    );
  }
  void searchPerfume (String query){
    final suggestions = perfumeData.where((perfumeData){
      final perfumeName = perfumeData.name?.toLowerCase();
      final input = query.toLowerCase();

      return perfumeName!.contains(input);
    }).toList();
    setState(() => perfumeData = suggestions);

  }
}
