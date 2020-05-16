

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/primariButton.dart';

class Soat extends StatefulWidget{
  @override
  _soatState createState() =>_soatState();


}

class _soatState extends State<Soat>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/bg_novus.png'),
                    fit:BoxFit.cover
                )
            ),

            /*decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit:BoxFit.cover
                )
            ),*/
          ),
          ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(children: <Widget>[
                    IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),
                    onPressed: (){
                      Navigator.pop(context);
                    },)
                  ],),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Container(
                      child:Image(
                        image: AssetImage('assets/merkarapid-oficial-w.png'),
                        width: 150.0,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left:20.0,right: 20.0),
                      child: _textPharagraph(),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(left:20.0,right: 20.0),
                      child: Text(
                        'Merkarapid ¡Facil y seguro!',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child:Form(
                      child: Padding(
                          padding: EdgeInsets.only(left:20.0,right: 20.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: "Cedula del propietario",
                                          hintStyle: TextStyle(color: Colors.white),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.0)),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white, width: 1.0)),
                                          focusColor: Color.fromRGBO(101, 232, 41, 0.5),
                                          prefixIcon: Icon(Icons.account_box,color: Colors.white,),
                                          counterStyle: TextStyle(color: Colors.white),
                                          fillColor: Colors.white30,
                                          filled: true,
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                                      )
                                  )//_buildTextField(),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10,right: 10),
                                  child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: "Placa del vehiculo",
                                          hintStyle: TextStyle(color: Colors.white),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.0)),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white, width: 1.0)),
                                          focusColor: Color.fromRGBO(101, 232, 41, 0.5),
                                          prefixIcon: Icon(Icons.directions_car,color: Colors.white,),
                                          counterStyle: TextStyle(color: Colors.white),
                                          fillColor: Colors.white30,
                                          filled: true,
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                                      )
                                  )//_buildTextField(),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              PrimaryButton(
                                onPressed: (){},
                                text: 'Enviar Información',
                                background:Colors.black,
                                fontSize: 18.0,
                              )
                            ],
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Container(
                      child:Image(
                        image: AssetImage('assets/logo_novus.png'),
                        width: 150.0,
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }


  _textPharagraph(){
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: TextStyle(color: Colors.white,fontSize: 20.0),
        children: <TextSpan>[
          TextSpan(text: 'Compra y renueva el '),
          TextSpan(text: 'SOAT',style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: ' de tu vehiculo aqui, completa la siguiente informacion y adquierelo con un solo toque a la pantalla'),

        ]
      ),
    );
  }

}