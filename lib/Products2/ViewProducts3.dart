import 'dart:convert';
import 'dart:developer';

import 'package:fakestore_api/Products2/Model2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../Product/ViewProductDetails.dart';



class ViewProduct3 extends StatefulWidget {
  const ViewProduct3({super.key});

  @override
  State<ViewProduct3> createState() => _ViewProduct3State();
}




class _ViewProduct3State extends State<ViewProduct3> {


  List<Product>? alldata;
  getdata()async
  {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode == 200)
    {
      var body  = response.body.toString();
      log(body);
      var json = jsonDecode(body);
      setState(() {
        alldata = json.map<Product>((obj)=>Product.fromJson(obj)).toList();
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
      body: (alldata == null)?Center(child: CircularProgressIndicator(),)
          :(alldata!.length <=0)
          ?Center(child: Text("Data not found!"),)
          :Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                SizedBox(height: 65.0,),
                Expanded(
                  child: Center(
                    child: Text("Products",  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),),
                  ),
                )
              ],
            ),
          ),

          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                ),
                itemCount: alldata!.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        Expanded(child: Image.network(
                          alldata![index].image.toString(),
                          width: 100.0,),),
                        SizedBox(height: 22.0,),
                        Row(
                          children: [
                            Text(alldata![index].category.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),

                        //    Text(snapshot.data![index]["title"].toString()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rs." + alldata![index].price.toString(),
                              style: TextStyle(
                                color: Color(0xFFC0C0C0),
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(height: 22.0,),
                            // Text("Rate: " + alldata![index].rating!.rating.toString(),
                            //   style: TextStyle(
                            //     color: Color(0xFFC0C0C0),
                            //     fontSize: 14.0,
                            //   ),
                            // ),
                  
                          ],
                        ),
                      ],
                    ),


                  );

                }),
          ),
        ],
      ),
    );

  }
}
