import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../model/Recipe.dart';
import 'RecipeDetails.dart';


class Searchrecipes extends StatefulWidget {
  const Searchrecipes({super.key});

  @override
  State<Searchrecipes> createState() => _SearchrecipesState();
}

class _SearchrecipesState extends State<Searchrecipes> {

  Recipe? obj;
  TextEditingController _name = TextEditingController();
  SearchRecipes(name)async{
    // Uri url = Uri.parse("https://dummyjson.com/recipes/search?q="+name.toString());
    // var response = await http.get(url);
    // if(response.statusCode==200){
    //   var json= jsonDecode(response.body.toString());
    //   setState(() {
    //     obj = Recipe.fromJson(json);
    //   });
    //
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blueGrey,
            border: Border.all(width: 1)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(onPressed: () async {
                  var name = _name.text.toString();
                  setState(() {
                    _name.text = "";
                  });
                  print(name);
                  Uri url = Uri.parse("https://dummyjson.com/recipes/search?q="+name.toString());
                  var response = await http.get(url);
                  if(response.statusCode==200){

                    var json= jsonDecode(response.body.toString());
                    setState(() {
                      obj = Recipe.fromJson(json);
                      log(json.toString());
                    });

                  }
                },icon: Icon(Icons.search),),
                border: InputBorder.none
              ),
              controller: _name,
            ),
          ),
        ),
      ),
      body: (obj==null)?Scaffold():ListView.builder(
        itemCount: obj!.recipes!.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.fromLTRB( 10,10,10,0),
            child: GestureDetector(
              onTap: (){
                  var id = obj!.recipes![index].id.toString();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetails(id: id)));
              },
              child: Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .2),
                        borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            height: MediaQuery.of(context).size.height*.1,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(width: .5),
                                borderRadius: BorderRadius.circular(14),
                              color: Colors.black26,
                              image: DecorationImage(
                                image: NetworkImage(obj!.recipes![index].image.toString()),fit: BoxFit.fill
                              )
                            ),

                          ),
                        ),
                      ),SizedBox(width: 10,),
                      Expanded(child: Text(obj!.recipes![index]!.name.toString()))
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
