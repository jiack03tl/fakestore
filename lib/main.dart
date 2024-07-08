import 'package:fakestore_api/Auth/LoginScreen.dart';
import 'package:fakestore_api/Function/SendMailScreen.dart';
import 'package:fakestore_api/HomeScreen.dart';
import 'package:fakestore_api/Product/GetSingleProduct.dart';
import 'package:fakestore_api/Product/ViewProduct.dart';
import 'package:fakestore_api/Products2/ViewProducts3.dart';
import 'package:fakestore_api/Recipe/DateFormatingExample.dart';

import 'package:fakestore_api/Recipe/SearchRecipes.dart';
import 'package:fakestore_api/Recipe/ViewRecipes.dart';
import 'package:flutter/material.dart';

import 'Recipe/AddRecipe.dart';
import 'Recipe/ViewRecipe2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DateFormatingExample(),
        // https://dummyjson.com/docs/recipes#recipes-all
    );
  }
}

