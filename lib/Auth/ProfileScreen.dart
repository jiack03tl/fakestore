import 'dart:convert';
import 'dart:developer';

import 'package:fakestore_api/Auth/LoginScreen.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var name = "";
  Future<List>? alldata;
 getdata() async
 {
    SharedPreferences prefs  = await SharedPreferences.getInstance();
    log("sp data"+ prefs.getString("userdata").toString());

    var jsonsp = jsonDecode(prefs.getString("userdata").toString());
    log(json.toString());
    Uri url = Uri.parse("https://dummyjson.com/auth/me");

    var header = {
      "Content-Type":"application/json",
      'Authorization': 'Bearer '+jsonsp["token"],
    };

    var response = await http.get(url,headers:(header));
    if(response.statusCode==200)
    {

      log("response status code: "+response.statusCode.toString());
      var jsondata = jsonDecode(response.body.toString());
      setState(() {
        name = jsondata["username"].toString();
        // log(jsondata);
        log(name);
      });

      // log(name.toString());
    }
    else{
      log("bad request :"+response.statusCode.toString());
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
        title: Text("ProfileScreen"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text("name "+name.toString(),style: TextStyle(fontSize: 20),),
            SizedBox(height: 300,),

            Container(
              height: 44,
              width: 300,
              child: ElevatedButton(
                onPressed: () async {

                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  log(prefs.getString("userdata").toString());
                  prefs.remove("userdata").toString();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                child: Text("logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
