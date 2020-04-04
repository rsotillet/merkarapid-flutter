import 'package:flutter/material.dart';

class Commerce extends StatefulWidget{
  @override
  _CommerceState createState( )=> new _CommerceState();

}

class _CommerceState extends State<Commerce>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comercio",style: TextStyle(color: Colors.white),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromRGBO(64,8,82, 1),
                    Color.fromRGBO(136,28,170, 1),
                  ])
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('Ronny Sotillet',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16.0),),
                accountEmail: Text('rsotillet@gmail.com',style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                    boxShadow: List<BoxShadow>(),
                    image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        colorFilter: ColorFilter.mode(Color.fromRGBO(68,4,68, .6), BlendMode.multiply),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ])
                  ),
                child: ListTile(
                  title: Text('With lightGreen background'),
                  onTap:() { },
                ),
              ),Ink(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors:  <Color>[
                          Color.fromRGBO(64,8,82, 1),
                          Color.fromRGBO(136,28,170, 1),
                        ])
                ),
                child: ListTile(
                  title: Text('With lightGreen background'),
                  onTap:() { },
                ),
              ),
            ],
          ),
        ),
      body: Center(child: Text('Hola mundo'),),
    );
  }

}