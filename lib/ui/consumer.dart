import 'package:flutter/material.dart';

class Consumer extends StatefulWidget{


  @override
  _consumerState createState() => _consumerState();

}

class _consumerState extends State<Consumer>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Consumidor"),
        flexibleSpace: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.red,
              Colors.blue
            ])
          ),
        ),
      ),

    );
  }

}