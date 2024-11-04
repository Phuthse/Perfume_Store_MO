import 'package:flutter/material.dart';
import 'package:perfume_store_mo/admin/addperfume.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            const Center(child: Text("Home Admin",),),
            const SizedBox(height: 50.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Addperfume()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: Row(children: [
                      Padding(padding: const EdgeInsets.all(6.0),
                      child: Image.asset("images/BVLGARI-Rose-Goldea.jpg", height: 100, width: 100, fit: BoxFit.cover,),),
                  const SizedBox(width: 30.0,) ,
                  const Text("Add Perfume Items", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),) ],),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}