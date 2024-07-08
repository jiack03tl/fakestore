import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

class GetSingleProduct extends StatefulWidget {
  const GetSingleProduct({super.key});

  @override
  State<GetSingleProduct> createState() => _GetSingleProductState();
}

class _GetSingleProductState extends State<GetSingleProduct> {
  var name ="";
  var description ="";
  var image = "";
  var tag = "";
  var reviews = "";
  getsingleproduct()async{

    Uri url = Uri.parse("https://dummyjson.com/products/1");
    var response = await http.get(url);

    if(response.statusCode==200)
      {
        log("login success");
      var json = jsonDecode(response.body.toString());
      // log(json.toString());
        log(json["review"].toString());

        setState(() {
        name = json["title"].toString();
        description = json["description"].toString();
        tag = json["tags"][1].toString();

        //image = json["images"][0].toString();
       reviews = json["reviews"]["rating"].toString();
       log(reviews);

        // log("++++++++++++++++++++++++++++++"+image.toString()+"===========================");
      });
      }
    else{
      log("bad request :"+response.statusCode.toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getsingleproduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single product"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.4),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Product Name: "+name,style: TextStyle(fontSize: 15),),
                    SizedBox(height: 10,),
                    // Text("description: "+description,style: TextStyle(fontSize: 15),),
                    Text("tag: "+tag,style: TextStyle(fontSize: 15),),
                   Text("reviews: "+reviews.toString(),style: TextStyle(fontSize: 15),),

                   Image.network(image.toString())
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
