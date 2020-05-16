import 'package:flutter/material.dart';
import 'package:merkarapid/models/static.dart';

class Domiciliary extends StatefulWidget{
  @override
  _domiciliaryState createState()=>_domiciliaryState();

}

class _domiciliaryState extends State<Domiciliary>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Domiciliarios"),
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
      body: ListView(
        children: Statics.domiciliarios.map((el){
          return Padding(
            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
            child: Ink(
              decoration: BoxDecoration(
                color: Color.fromRGBO(180,187,185,1),
                //color: Color.fromRGBO(9,173,120, 1)
              ),
              child: ListTile(
                leading: Icon(Icons.directions_bike,color: Colors.white,),
                title: Text(el.elementAt(0)+' '+el.elementAt(1),style: TextStyle(color: Colors.white),),
                trailing: Text('Seleccionar',style: TextStyle(color: Colors.white)),
                onTap: (){
                  if(Statics.idAux!=-1){
                    Statics.pedidos.elementAt(Statics.idAux).replaceRange(3,5,['2',Statics.domiciliarios.indexOf(el).toString()]);
                    print(Statics.pedidos.elementAt(Statics.idAux));
                    Navigator.pop(context);
                  }else{
                    Statics.editidAux = Statics.domiciliarios.indexOf(el);
                    Navigator.pushNamed(context, '/addDomiciliary');
                  }
                },
              ),
            ),
          );
        }).toList()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Statics.editidAux=-1;
          Navigator.pushNamed(context, '/addDomiciliary');
        },
        backgroundColor: Color.fromRGBO(136,28,170, 1),
        child: Icon(Icons.add),
      ),

    );
  }

}