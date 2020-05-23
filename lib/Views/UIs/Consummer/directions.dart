import 'package:flutter/material.dart';

class Directions extends StatefulWidget{

  @override
  _DirectionsState createState()=>_DirectionsState();


}

class _DirectionsState extends State<Directions>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mis direcciones"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient:
            LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromRGBO(244, 111, 51, 1),
                  Color.fromRGBO(255, 149, 2, 1)]
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildDirectionsList('Carrera 102b #56f 61 sur', 'Casa'),
          _buildDirectionsList('Calle 22 #13 61', 'Casa Mamá'),
          _buildDirectionsList('Carrera 44 #77 7 61', 'Trabajo'),
        ],
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
        },
        backgroundColor: Color.fromRGBO(244, 111, 51, 1),
        child: Icon(Icons.add),
      )

    );
  }

  _buildDirectionsList(String direccion,String titulo){
    return Padding(
      padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
      child: Ink(
        decoration: BoxDecoration(
          color: Color.fromRGBO(180,187,185,1),
          //color: Color.fromRGBO(9,173,120, 1)
        ),
        child: ListTile(
          leading: Icon(Icons.location_on,color: Colors.white,),
          title: Text(titulo,style: TextStyle(color: Colors.white)),
          subtitle: Text(direccion,style: TextStyle(color: Colors.white)),
          onTap: (){

          },
        ),
      ),
    );
  }

}