import 'dart:convert';
import 'dart:developer';

import 'package:fakestore_api/Auth/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      _username.text= "emilys".toString();
      _password.text= "emilyspass".toString();

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(

            decoration: BoxDecoration(
              border: Border.all(width: 2,color: Colors.black)
            ),
            child: Column( crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(
                 decoration: BoxDecoration(
                   color: Colors.blueGrey,
                   borderRadius: BorderRadius.circular(15)
                 ),
                 child: TextField(
                   controller: _username,
                   decoration: InputDecoration(
                     border: InputBorder.none,
                     hintText: _username.toString()
                   ),
                 ),

               ),
                SizedBox(height: 15,),

                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextField(
                    controller: _password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: _username.toString()
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 44,
                    width: 300,
                    child: ElevatedButton(onPressed: ()async{
                      // print("button pressed");

                      var username = _username.text.toString();
                      var password = _password.text.toString();

                      var header={
                        "Content-Type":"application/json"
                      };

                      var params = {
                        "username":username,
                        "password":password
                      };

                      Uri url = Uri.parse("https://dummyjson.com/auth/login");
                      var response = await http.post(url,body: jsonEncode(params),headers: header,);

                      if(response.statusCode==200){
                        log("login success");

                        var body = response.body.toString();

                        SharedPreferences pref = await SharedPreferences.getInstance();
                        pref.setString("userdata",body).toString();

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));

                        // log(body["username"].toString());
                      }
                      else{
                       log("invalid login");
                      }


                    }, child: Text("login")),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
