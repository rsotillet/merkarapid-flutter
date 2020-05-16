import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/ItemProduct.dart';
import 'package:merkarapid/Views/Partials/ShowOptions.dart';
import 'package:merkarapid/Views/Partials/primariButton.dart';

import 'package:url_launcher/url_launcher.dart' ;
import 'package:maps_launcher/maps_launcher.dart';
import 'package:merkarapid/models/static.dart';

class OrderDetail extends StatefulWidget{
  @override
  _orderDetailState createState() =>_orderDetailState();

}

class _orderDetailState extends State<OrderDetail>{
  @override
  Widget build(BuildContext context) {
    int price=0;
    List<dynamic> products=[];

    var aux = Statics.pedidos.elementAt(Statics.idAux).elementAt(2).split(',');
    //print("pedido: "+el.elementAt(0));
    for (var x = 0; x < aux.length; x++) {
      var aux2=aux.elementAt(x).split('-');
      products.add(aux2);
      //print(aux2.elementAt(1)+' '+Statics.productos.elementAt(int.parse(aux2.elementAt(0))).elementAt(0));
      price+=int.parse(Statics.productos.elementAt(int.parse(aux2.elementAt(0))).elementAt(1))*int.parse(aux2.elementAt(1));
      //print(aux2.elementAt(1)+" ");
    }
    //print('precio: '+price.toString());



    // TODO: implement build
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled ){
          return <Widget>[
            SliverAppBar(
              title:Text("Pedido #"+Statics.pedidos.elementAt(Statics.idAux).elementAt(0)),
              backgroundColor: Color.fromRGBO(64,8,82, 1),
              //expandedHeight: MediaQuery.of(context).size.height,
              expandedHeight: MediaQuery.of(context).size.height/3,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Container(
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
                    Positioned(
                      bottom: 20.0,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.person,size: 46.0,color: Colors.white,),
                                Text('Datos del Cliente',style: TextStyle(color: Colors.white,fontSize: 26.0),)
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(Statics.clientes.elementAt(Statics.pedidos.elementAt(Statics.idAux).elementAt(1)).elementAt(0),style: TextStyle(color: Colors.white,fontSize: 26.0)),
                                    Text(Statics.clientes.elementAt(Statics.pedidos.elementAt(Statics.idAux).elementAt(1)).elementAt(1),style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    ClipOval(
                                      child: Material(
                                        color: Color.fromRGBO(9,173,120, 1),
                                        child: InkWell(
                                          child: SizedBox(width: 50,height: 50,child: Icon(Icons.place,size: 35,color: Colors.white)),
                                          onTap: () {
                                            MapsLauncher.launchQuery(Statics.clientes.elementAt(Statics.pedidos.elementAt(Statics.idAux).elementAt(1)).elementAt(1)+',Bogota,Colombia');
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  children: <Widget>[
                                    ClipOval(
                                      child: Material(
                                        color: Color.fromRGBO(9,173,120, 1),
                                        child: InkWell(
                                          child: SizedBox(width: 50,height: 50,child: Icon(Icons.phone,size: 35,color: Colors.white)),
                                          onTap: () {
                                            launch('tel:'+Statics.clientes.elementAt(Statics.pedidos.elementAt(Statics.idAux).elementAt(1)).elementAt(2));
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.group_work,size: 36.0,color: Colors.grey,),
                    Text('Productos',style: TextStyle(color: Colors.grey,fontSize: 26.0),)
                  ],
                ),
              ),
          Container(
            height: 200.0,
            padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                    child:  ListView(
                    scrollDirection: Axis.horizontal,
                    children: products.map((el){
                      return ItemProduct(
                        el: el,
                      );
                    }).toList()
                  )
                )
              ],
            ),
          ),
              Container(
                child:Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.monetization_on,size: 36.0,color: Colors.grey,),
                          Text('Resumen de Pago',style: TextStyle(color: Colors.grey,fontSize: 26.0),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.0,left: 16.0,right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Total Productos',style: TextStyle(fontSize: 16.0),),
                          Text('\$'+price.toString(),style: TextStyle(fontSize: 16.0),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0,left: 16.0,right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Comision Merkarapid',style: TextStyle(fontSize: 16.0),),
                          Text('\$1.000',style: TextStyle(fontSize: 16.0),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8,left: 16.0,right: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Total a Cobrar',style: TextStyle(fontSize: 16.0),),
                          Text('\$'+(price+1000).toString(),style: TextStyle(fontSize: 16.0),)
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    if(Statics.pedidos.elementAt(Statics.idAux).elementAt(3)=='0')
                      PrimaryButton(
                        onPressed: ()async {
                          bool option = await ShowOptions.showConfirm(context, "Confirmacion de Pedido", "¿Desea aceptar el pedido #99999999 de JAvier Zabala por \$9.999.999?", Color.fromRGBO(136,28,170, 1));
                          print(Statics.pedidos.elementAt(Statics.idAux));
                          String value = option?'1':'3';
                          print(value);
                          Statics.pedidos.elementAt(Statics.idAux).replaceRange(3,4,[value]);
                          setState(() {

                          });
                        },
                        text:"Aceptar Pedido",
                        background: Color.fromRGBO(136, 28, 170, 1),
                      ),
                    if(Statics.pedidos.elementAt(Statics.idAux).elementAt(3)=='1')
                      PrimaryButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/domiciliary');
                        },
                        text:"Entregar a Domiciliario",
                        background: Color.fromRGBO(136, 28, 170, 1),
                      ),
                    if(Statics.pedidos.elementAt(Statics.idAux).elementAt(3)=='2')
                      PrimaryButton(
                        text:"Entregado a "+Statics.domiciliarios.elementAt(int.parse(Statics.pedidos.elementAt(Statics.idAux).elementAt(4))).elementAt(0)+' '+Statics.domiciliarios.elementAt(int.parse(Statics.pedidos.elementAt(Statics.idAux).elementAt(4))).elementAt(1),
                        background: Color.fromRGBO(136, 28, 170, 1),
                      ),
                    if(Statics.pedidos.elementAt(Statics.idAux).elementAt(3)=='3')
                      PrimaryButton(
                        text:"Cancelado",
                        background: Color.fromRGBO(136, 28, 170, 1),
                      ),
                    SizedBox(height: 10.0,),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }



}