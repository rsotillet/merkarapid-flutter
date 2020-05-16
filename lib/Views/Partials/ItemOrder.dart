import 'package:flutter/material.dart';
import 'package:merkarapid/models/static.dart';

// ignore: must_be_immutable
class ItemOrder extends StatelessWidget {
  final dynamic el;
  final Function onPressed;
  int price;
  final bool client;

  ItemOrder({this.el, this.client:false, this.onPressed});


  @override
  Widget build(BuildContext context) {
    price=0;
    var aux = el.elementAt(2).split(',');
    //print("pedido: "+el.elementAt(0));
    for (var x = 0; x < aux.length; x++) {
      var aux2=aux.elementAt(x).split('-');
      //print(aux2.elementAt(1)+' '+Statics.productos.elementAt(int.parse(aux2.elementAt(0))).elementAt(0));
      price+=int.parse(Statics.productos.elementAt(int.parse(aux2.elementAt(0))).elementAt(1))*int.parse(aux2.elementAt(1));
      //print(aux2.elementAt(1)+" ");
    }
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Material(
          child: Container(
            width: 258.0,
            decoration: BoxDecoration(
              //color: Color.fromRGBO(9,173,120, 1),
                color: Color.fromRGBO(180,187,185,1),
                //color: Color.fromRGBO(255,149,2,1),
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: onPressed,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget>[
                            Text("Pedido #"+el.elementAt(0),style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(el.elementAt(3)=='0'?'PENDIENTE':el.elementAt(3)=='1'?'EN PROCESO':el.elementAt(3)=='2'?'ENTREGADO':'CANCELADO',style: TextStyle(fontSize: 10.0),),
                              ),
                              decoration: BoxDecoration(
                                  color: el.elementAt(3)=='0'?Color.fromRGBO(250,188,25, 1):el.elementAt(3)=='1'?Color.fromRGBO(25,250,177, 1):(el.elementAt(3)=='2')?Color.fromRGBO(35,198,200, 1):Color.fromRGBO(242,56,39, 1),
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0,right: 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: client?MainAxisAlignment.end:MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          if(!client)
                            Text(Statics.clientes.elementAt(el.elementAt(1)).elementAt(0),style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                          Text('\$'+price.toString(),style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
