import 'dart:convert';
import 'dart:developer';


import 'package:fakestore_api/model/Recipe2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';


class Viewrecipe2 extends StatefulWidget {
  const Viewrecipe2({super.key});

  @override
  State<Viewrecipe2> createState() => _Viewrecipe2State();
}

class _Viewrecipe2State extends State<Viewrecipe2> {

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

  // Future<bool> checkfav(id) async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? mylist = prefs.getStringList("fav");
  //   if(mylist!.contains(id))
  //   {
  //     return true;
  //   }
  //   else
  //   {
  //     return false;
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true,
        title: Text("view recipe 2"),
      ),
      body: (alldata!=null )?ListView.builder(
        itemCount: alldata!.length,
        itemBuilder: (context,index) {

          Color col = Colors.black;

          if(myfav!.contains(alldata![index].id.toString()))
          {
            col = Colors.red;
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: ListTile(
                title:Text(alldata![index].name.toString()),
                subtitle: Text(alldata![index].ingredients.toString()),
                leading:  Text(alldata![index].userId.toString()),
                trailing: GestureDetector(
                  onTap: () async{
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    if(prefs.containsKey("fav"))
                    {
                      List<String>? mylist = prefs.getStringList("fav");
                      if(mylist!.contains(alldata![index].id.toString()))
                      {
                        mylist.remove(alldata![index].id.toString());
                        prefs.setStringList("fav", mylist);
                        log("Value Deleted");
                        getdata();
                      }
                      else
                      {
                        mylist.add(alldata![index].id.toString());
                        prefs.setStringList("fav", mylist);
                        log("Value Added");
                        getdata();
                      }
                    }
                    else
                    {
                      List<String>? mydata = [];
                      mydata!.add(alldata![index].id.toString());
                      prefs.setStringList("fav", mydata);
                      log("New Value added");
                      getdata();
                    }
                    await getdata();

                  },
                  child: Icon(Icons.favorite,color: col,),
                ),
              ),
            ),
          );
        },
      ):SizedBox(),
    );
  }

}

