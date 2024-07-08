import 'dart:convert';
import 'dart:developer';

import 'package:fakestore_api/model/Authors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateFormatingExample extends StatefulWidget {
  const DateFormatingExample({super.key});

  @override
  State<DateFormatingExample> createState() => _DateFormatingExampleState();
}

class _DateFormatingExampleState extends State<DateFormatingExample> {

  List<String>? myfav=[];

  var booksData = [
    {
      "id": 1,
      "name": "The Great Gatsby",
      "author": "F. Scott Fitzgerald",
      "date": "1925-04-10"
    },
    {
      "id": 2,
      "name": "To Kill a Mockingbird",
      "author": "Harper Lee",
      "date": "1960-07-11"
    },
    {
      "id": 3,
      "name": "rob",
      "author": "George Orwell",
      "date": "1949-06-08"
    },
    {
      "id": 4,
      "name": "georgia",
      "author": "Georgia olsen",
      "date": "1729-10-08"
    },
    {
      "id": 5,
      "name": "mcfury",
      "author": "furyy",
      "date": "1990-02-02"
    },
    {
      "id": 6,
      "name": "mark",
      "author": "mark",
      "date": "1629-10-10"
    },
    {
      "id": 7,
      "name": "harry",
      "author": "harry peter",
      "date": "1909-10-08"
    },
    {
      "id": 8,
      "name": "ohm",
      "author": "omen",
      "date": "1709-10-28"
    },
    {
      "id": 9,
      "name": "lily",
      "author": "lyilyyami",
      "date": "1929-10-08"
    },
    {
      "id": 10,
      "name": "ilsa",
      "author": "ilisa",
      "date": "1729-10-08"
    },
  ];
  List<Authors>? alldata;

  getdata() async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
    if(prefs.containsKey("favauthor"))
    {
      setState(() {
        myfav= prefs.getStringList("favauthor");
        log(prefs.getStringList("favauthor").toString());
      });
    }
    var json = jsonDecode(jsonEncode(booksData.toString()));
    log(json.toString());
    setState(() {
      alldata = booksData.map((obj)=>Authors.fromJson(obj)).toList();
    });
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
        title: Text("DateFormatingExample"),
      ),
      body: (alldata!=null)?ListView.builder(
        itemCount: alldata!.length,
        itemBuilder: (context,index){

          Color color = Colors.black;

          if(myfav!.contains(alldata![index].id.toString()))
          {
            color = Colors.red;
          }

          DateFormat originalFormat = DateFormat('yyyy-MM-dd');
          DateFormat targetFormat = DateFormat('dd-MM-yyyy');
          DateTime dateTime = originalFormat.parse(alldata![index].date.toString());
          var d = targetFormat.format(dateTime);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey
              ),
              child: ListTile(

                title: Text("Name "+alldata![index].name.toString()),
                subtitle: Text("Publish Date: "+d.toString()),
                trailing: GestureDetector(
                  onTap: ()async{
                    log("pressssed");
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    if(prefs.containsKey("favauthor"))
                    {
                     List<String>? mylist = prefs.getStringList("favauthor");
                       if (mylist!.contains(alldata![index].id.toString()))
                       {
                         mylist.remove(alldata![index].id.toString());
                         prefs.setStringList("favauthor", mylist.toList());
                         log("values deleted" + mylist.toString() + " myfav list is: " + myfav.toString());
                         getdata();
                       }
                       else{
                         mylist.add(alldata![index].id.toString());
                         prefs.setStringList("favauthor",mylist.toList());
                         log("value added :"+mylist.toString()+"my fav list is : "+mylist.toString());
                         getdata();
                       }
                    }
                    else{
                      List<String>? mydata= [];
                      mydata.add(alldata![index].id.toString());
                      prefs.setStringList("favauthor", mydata.toList());
                      log("my data is : "+mydata.toString());
                      getdata();
                    }
                    await getdata();
                  },
                 child: Icon(Icons.favorite,color: color,),
                ),
              ),
            ),
          );
        },
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
