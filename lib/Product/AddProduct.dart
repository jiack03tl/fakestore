import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
    Container(
    child: TextField(

    decoration: InputDecoration(
    hintText: "id",
    border: InputBorder.none
    ),
    ),
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(15),
    ),
    ),
    SizedBox(height: 10,),
    Container(
    child: TextField(

    decoration: InputDecoration(
    hintText: "Name",
    border: InputBorder.none
    ),
    ),
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(15),

    ),
    ),
    SizedBox(height: 10,),
    Container(
    child: TextField(

    decoration: InputDecoration(
    hintText: "Name",
    border: InputBorder.none
    ),
    ),
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(15),

    ),

    ),
    SizedBox(height: 10,),
    ElevatedButton(onPressed: ()async{
    Uri url =Uri.parse("");
    }, child: Text("Submit"))


    ],
    ),
    ),
    );
  }
}
