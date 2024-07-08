
import 'package:flutter/material.dart';

import '../model/Products.dart';

class ViewProductDetails extends StatefulWidget {
  Products obj;
  ViewProductDetails({required this.obj});

  @override
  State<ViewProductDetails> createState() => _ViewProductDetailsState();
}

class _ViewProductDetailsState extends State<ViewProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [

            SizedBox(height: 33.0,),

            GestureDetector(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_outlined),
                ],
              ),
            ),

            SizedBox(height: 33.0,),

            FadeInImage.assetNetwork(
              placeholder: '',
              image: widget.obj.images.toString(),
              width: 100,
              placeholderErrorBuilder: (context, error, stackTrace) {
                return CircularProgressIndicator();
              },
            ),
            SizedBox(height: 33.0,),

            Row(
              children: [
                Text(widget.obj.category.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),),
              ],
            ),

            Row(
              children: [
                Text("₹."+widget.obj.price.toString(),
                  style: TextStyle(
                    fontSize: 14.0,
                  ),),
              ],
            ),

            Row(
              children: [
                // Text("Rates."+widget.obj.rating!.rate.toString(),
                //   style: TextStyle(
                //     fontSize: 12.0,
                //   ),
                // ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text("Rates."+widget.obj.title.toString(),
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(child: Text(widget.obj.description.toString(),
                  style: TextStyle(
                    color: Color(0xFFC0C0C0),
                    fontSize: 12.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                ),
              ],
            ),


          ],
        ),
      ),
    );

  }
}
