import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';


import 'package:fakestore_api/model/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../model/Recipe2.dart';
class RecipeDetails extends StatefulWidget {
  var id = "";
  RecipeDetails({ required this.id});

  @override
  State<RecipeDetails> createState() => _RecipeDetailsState();
}

class _RecipeDetailsState extends State<RecipeDetails> {
  Recipe2? obj;
  List<Recipe>? ingred;

  getdata() async {
    Uri url = Uri.parse("https://dummyjson.com/recipes/" + widget.id);
    log(widget.id.toString());
    map(List<String>? ingredients) {}
    var response = await http.get(url);
    if(response.statusCode==200){
      var json = jsonDecode(response.body.toString());
      log(json.toString());
      setState(() {
        obj=Recipe2.fromJson(json);

      });
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
        backgroundColor: Colors.black26,
        centerTitle: true,
        title: Text("Recipe Details",style: TextStyle(color: Colors.blueGrey),),
      ),
      body: (obj==null )?
      Scaffold():
      Padding(
        padding: const EdgeInsets.all(14.0),

        child: Material(
          borderRadius: BorderRadius.circular(20),
          elevation: 8,

          child: Container(
            // height: MediaQuery.of(context).size.height*.4,
            // width: MediaQuery.of(context).size.width,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    elevation: 5,
                    child: Container(
                        height: MediaQuery.of(context).size.width*0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(

                            image: NetworkImage(obj!.image.toString(),),fit: BoxFit.cover
                          )
                        ),
                    ),
                  ),
                  Text("Name: "+obj!.name.toString(),style: TextStyle(fontSize: 18),),SizedBox(),
                  Text("Ingredients : "+obj!.ingredients.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),SizedBox(),
                  Text("servings : "+obj!.servings.toString(),style: TextStyle(fontSize: 15),),SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Container(
                      height: 40,
                      child: ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Back to Recipes",style: TextStyle(fontSize: 20,color: Colors.black87),)),
                    ),
                  )
                ],
              ),

            ),
          ),
        ),

      ),


    );
  }
}
