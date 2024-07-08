import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Addrecipe extends StatefulWidget {
  const Addrecipe({super.key});

  @override
  State<Addrecipe> createState() => _AddrecipeState();
}

class _AddrecipeState extends State<Addrecipe> {
  TextEditingController _id= TextEditingController();
  TextEditingController _name= TextEditingController();
  TextEditingController _ingredients= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add recipce"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: _id,
                decoration: InputDecoration(
                  hintText: "id",
                  border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),

              ),

            ),
            SizedBox(height: 10,),
            Container(
              child: TextField(
                controller: _ingredients,
                decoration: InputDecoration(
                    hintText: "Name",
                    border: InputBorder.none
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),

              ),

            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()async{
              Uri url =Uri.parse("");
            }, child: Text("Submit"))


          ],
        ),
      ),
    );
  }
}
