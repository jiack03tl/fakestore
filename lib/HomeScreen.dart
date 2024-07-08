import 'package:fakestore_api/Auth/ProfileScreen.dart';
import 'package:fakestore_api/Product/AddProduct.dart';
import 'package:fakestore_api/Products2/ViewProducts3.dart';
import 'package:fakestore_api/Recipe/DateFormatingExample.dart';
import 'package:fakestore_api/Recipe/MyFavList.dart';
import 'package:fakestore_api/Recipe/ViewRecipe2.dart';

import 'package:fakestore_api/Recipe/ViewRecipes.dart';
import 'package:flutter/material.dart';

import 'Product/ViewProduct.dart';
import 'Recipe/SearchRecipes.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("products/Recipe"),
      ),
      drawer: Drawer(
        child: Drawer(
          child: ListView(
            children: [
             ListTile(
               title: Text("Profile"),
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
               },
             ),

              ListTile(
                title: Text("View Products"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct()));
                },
              ),
              ListTile(
                title: Text("View Products3 "),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProduct3()));
                },
              ),
              ListTile(
                title: Text("Add Products"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
                },
              ),

              ListTile(
                title: Text("View Recipes"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewrecipes()));
                },
              ),
              ListTile(
                title: Text("View Recipes2"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewrecipe2()));
                },
              ),
              ListTile(
                title: Text("Search Recipe"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchrecipes()));
                },
              ),
              ListTile(
                title: Text("Fav List"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavList()));
                },
              ),
              ListTile(
                title: Text("Fav & date format"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DateFormatingExample()));
                },
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index){
            return Container();
      }),
    );
  }
}
