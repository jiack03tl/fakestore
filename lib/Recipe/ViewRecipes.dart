import 'dart:convert';
import 'dart:developer';

import 'package:fakestore_api/Recipe/RecipeDetails.dart';
import 'package:fakestore_api/model/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Viewrecipes extends StatefulWidget {
  const Viewrecipes({super.key});

  @override
  State<Viewrecipes> createState() => _ViewrecipesState();
}
class _ViewrecipesState extends State<Viewrecipes> {

  Recipe? obj;

  getdata()async{
    
    Uri url = Uri.parse("https://dummyjson.com/recipes");
    var response = await http.get(url);
    if(response.statusCode==200)
      {
        var json =jsonDecode(response.body.toString());
        setState(() {
          obj = Recipe.fromJson(json);
        });

      }
    else{
      log("bad request "+response.statusCode.toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("View Recipes"),
      ),
      body: (obj==null)?
      Center(child: CircularProgressIndicator(),):(obj!.recipes!.length<=0)?
          Center(child: Text("No data found"),)
          :
      ListView.builder(
        itemCount: obj!.recipes!.length,
        itemBuilder: (context,index)
        {
          return
            GestureDetector(
              onTap: (){
                var id = obj!.recipes![index].id.toString();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetails(id: id)));
              },
              child: ListTile(
              title: Text(obj!.recipes![index].name.toString()),
              subtitle: Text(obj!.recipes![index].ingredients![0].toString()),
                        ),
            );
        },
      ),
    );
  }
}
