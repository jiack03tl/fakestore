import 'package:flutter/material.dart';

class Updateproduct extends StatefulWidget {
  const Updateproduct({super.key});

  @override
  State<Updateproduct> createState() => _UpdateproductState();
}

class _UpdateproductState extends State<Updateproduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update product"),
      ),
    );
  }
}
