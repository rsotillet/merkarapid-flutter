import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/ShowOptions.dart';
import 'package:merkarapid/models/static.dart';
import 'package:url_launcher/url_launcher.dart' ;

class OrderDetailConsummer extends StatefulWidget{
  @override
  _OrderDetailConsummerState createState() =>_OrderDetailConsummerState();

}

class _OrderDetailConsummerState extends State<OrderDetailConsummer>{
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
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled ){
            return <Widget>[
              SliverAppBar(
                title:Text("Pedido #"+Statics.pedidos.elementAt(Statics.idAux).elementAt(0)),
                backgroundColor: Color.fromRGBO(255, 149, 2, 1),
                //expandedHeight: MediaQuery.of(context).size.height,
                expandedHeight: MediaQuery.of(context).size.height/2,
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
                                  Color.fromRGBO(244, 111, 51, 1),
                                  Color.fromRGBO(255, 149, 2, 1),
                                ])
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 20,
                                    child: Text('1',style: TextStyle(color: Colors.white),),
                                    backgroundColor: Color.fromRGBO(250,188,25, 1),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text('Hemos recibido tu pedido',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 18.0,
                                  ),
                                  Container(
                                    width: 5.0,
                                    height: 15.0,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(250,188,25, 1)),
                                      value: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 20,
                                    child: Text('2',style: TextStyle(color: Colors.white),),
                                    backgroundColor: Color.fromRGBO(250,188,25, 1),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text('Estamos preparando tu pedido',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 18.0,
                                  ),
                                  Container(
                                    width: 5.0,
                                    height: 15.0,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(250,188,25, 1)),
                                      value: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[

                                  SizedBox(
                                    width: 38.0,
                                    height: 38.0,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(250,188,25, 1)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30.0,
                                  ),
                                  Text('Tu pedido ya va en camino',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18.0),)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 18.0,
                                  ),
                                  Container(
                                    width: 5.0,
                                    height: 15.0,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(250,188,25, 1)),
                                      value: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 20,
                                    child: Text('4',style: TextStyle(color: Colors.white),),
                                    backgroundColor: Color.fromRGBO(250,188,25, 1),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text('Tu pedido ha llegado',style: TextStyle(color: Colors.white),)
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 18.0,
                                  ),
                                  Container(
                                    width: 5.0,
                                    height: 15.0,
                                    child: LinearProgressIndicator(
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(250,188,25, 1)),
                                      value: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 20,
                                    child: Text('5',style: TextStyle(color: Colors.white),),
                                    backgroundColor: Color.fromRGBO(250,188,25, 1),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text('Tu pedido ha sido entregado',style: TextStyle(color: Colors.white),)
                                ],
                              ),
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
                                return Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Material(
                                      child: Container(
                                        width: 300.0,
                                        decoration: BoxDecoration(
                                          //color: Color.fromRGBO(9,173,120, 1),
                                            color: Color.fromRGBO(180,187,185,1),
                                            //color: Color.fromRGBO(255,149,2,1),
                                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: FlatButton(
                                            onPressed: (){
                                              //Navigator.pushNamed(context, '/orderDetail',arguments: 'PENDIENTE');
                                            },
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.all(10.0),
                                                      child: Text(Statics.productos.elementAt(int.parse(el.elementAt(0))).elementAt(0),style: TextStyle(fontSize: 26.0,color: Colors.white),),
                                                    ),
                                                    /*Checkbox(
                                            value: false,
                                            checkColor: Colors.purple,
                                            activeColor: Colors.white,
                                            onChanged: (bool){},
                                          )*/
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text('\$'+(int.parse(Statics.productos.elementAt(int.parse(el.elementAt(0))).elementAt(1))*int.parse(el.elementAt(1))).toString(),style: TextStyle(fontSize: 20.0,color: Colors.white),),
                                                ),
                                                Center(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(10.0),
                                                      child: Text(el.elementAt(1)+' '+Statics.productos.elementAt(int.parse(el.elementAt(0))).elementAt(3),style:  TextStyle(fontSize: 20.0)),
                                                    ),
                                                  ),
                                                )

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
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
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.home,size: 36.0,color: Colors.grey,),
                            Text('Tendero',style: TextStyle(color: Colors.grey,fontSize: 26.0),)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Fruver la plaza',style: TextStyle(fontSize: 16.0),),
                          ClipOval(
                            child: Material(
                              color: Color.fromRGBO(250,188,25, 1),
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
                  ),
                ),
                Container(
                  child:Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.directions_bike,size: 36.0,color: Colors.grey,),
                            Text('Domiciliario',style: TextStyle(color: Colors.grey,fontSize: 26.0),)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text('Lewiz Pérez',style: TextStyle(fontSize: 16.0),),
                          ClipOval(
                            child: Material(
                              color: Color.fromRGBO(250,188,25, 1),
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
                  ),
                ),
                Container(
                  child:Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
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
                        Container(
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            onPressed: ()async {
                              bool option = await ShowOptions.showConfirm(context, "Confirmacion de Pedido", "¿Desea aceptar el pedido #99999999 de JAvier Zabala por \$9.999.999?",Color.fromRGBO(136,28,170, 1));
                              print(Statics.pedidos.elementAt(Statics.idAux));
                              String value = option?'1':'3';
                              print(value);
                              Statics.pedidos.elementAt(Statics.idAux).replaceRange(3,4,[value]);
                              setState(() {

                              });
                            },
                            disabledColor: Colors.grey,
                            color:  Color.fromRGBO(136,28,170, 1),
                            child: Text(
                              "Aceptar Pedido",
                              style: TextStyle(
                                color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                                fontSize: 26.0,
                              ),
                            ),
                          ),),
                        ),
                      SizedBox(height: 10.0,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ) /*ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

            ],
          )
        ],
      ),

    );*/
    );
  }



}