import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
          elevation: 0.0,
          color: Colors.redAccent[50],
          child: Container(
          height: MediaQuery.of(context).size.width/3,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(),
            child: Center(child: Text("data")))),),
      )
    );
  }
}