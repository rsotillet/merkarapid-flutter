import 'package:flutter/material.dart';
import 'package:merkarapid/models/static.dart';

class CommerceList extends StatefulWidget{
  @override
  _commerceListState createState()=>_commerceListState();

}

class _commerceListState extends State<CommerceList>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Comercios"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color.fromRGBO(244, 111, 51, 1),
                    Color.fromRGBO(255, 149, 2, 1),
                  ])
          ),
        ),
      ),
      body: ListView(
        children: Statics.productos.map((el){
          return Padding(
            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
            child: Ink(
              decoration: BoxDecoration(
                color: Color.fromRGBO(180,187,185,1),
                //color: Color.fromRGBO(9,173,120, 1)
              ),
              child: ListTile(
                leading: Icon(Icons.fastfood,color: Colors.white,),
                title: Text(el.elementAt(0),style: TextStyle(color: Colors.white)),
                subtitle: Text(el.elementAt(3),style: TextStyle(color: Colors.white)),
                trailing: Text('\$'+el.elementAt(1),style: TextStyle(color: Colors.white)),
                onTap: (){
                  Statics.editidAux=Statics.productos.indexOf(el);
                  Navigator.pushNamed(context,'/addproducts');
                },
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Statics.editidAux=-1;
          Navigator.pushNamed(context,'/addproducts');
        },
        backgroundColor: Color.fromRGBO(136,28,170, 1),
        child: Icon(Icons.add),
      ),

    );
  }

}