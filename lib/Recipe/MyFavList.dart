import 'dart:convert';
import 'dart:developer';


import 'package:fakestore_api/model/Recipe2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyFavList extends StatefulWidget {
  const MyFavList({super.key});

  @override
  State<MyFavList> createState() => _MyFavListState();
}

class _MyFavListState extends State<MyFavList> {

  List<Recipe2>? alldata;
  List<String>? myfav=[];
  getdata()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("fav"))
    {
      setState(() {
        myfav = prefs.getStringList("fav");
      });
    }
    Uri url = Uri.parse("https://dummyjson.com/recipes");
    var response = await http.get(url);
    if(response.statusCode==200){
      var json = jsonDecode(response.body.toString());
      setState(() {
        alldata = json["recipes"].map<Recipe2>((jsonobj)=>Recipe2.fromJson(jsonobj)).toList();
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
      appBar: AppBar( centerTitle: true,
        title: Text("view recipe 2"),
      ),
      body: (alldata!=null )?ListView.builder(
        itemCount: alldata!.length,
        itemBuilder: (context,index) {
          if(myfav!.contains(alldata![index].id.toString())) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: ListTile(
                  title: Text(alldata![index].name.toString()),
                  trailing: IconButton(icon:Icon(Icons.delete),
                    onPressed: () async {
                    myfav!.remove(alldata![index].id.toString());
                    SharedPreferences prefs = await SharedPreferences.getInstance() ;
                    prefs.setStringList("fav",myfav!);
                    log("item deleted and remaining items are: "+myfav.toString());
                    getdata();
                    },)
                ),
              ),
            );
          }
          else
            {
              return SizedBox();
            }
        },
      ):SizedBox(),
    );
  }

}
