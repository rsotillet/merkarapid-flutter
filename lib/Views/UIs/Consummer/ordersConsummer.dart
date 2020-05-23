import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/ItemOrder.dart';
import 'package:merkarapid/models/static.dart';
class OrdersConsummer extends StatefulWidget{
  @override
  _OrdersConsummerState createState()=>_OrdersConsummerState();

}

class _OrdersConsummerState extends State<OrdersConsummer>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pedidos'),
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
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: IconButton(
                  icon: Icon(Icons.filter_list),
                  color: Colors.white,
                  onPressed: (){},
                )
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'En Proceso',
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                text: 'Finalizados',
                icon: Icon(Icons.check_circle_outline),
              ),
            ],
          ),
        ),
        body: TabBarView(
            children: <Widget>[
              ListView(
                children: _buildListItem2('1'),
              ),
              ListView(
                children: _buildListItem2('2'),
              ),
            ]
        ),
      ),
    );
  }
  
  List<Widget>_buildListItem2(String status){
    return Statics.pedidos.map((el){
      int price =0;
      if(el.elementAt(3)==status){
        var aux = el.elementAt(2).split(',');
        //print("pedido: "+el.elementAt(0));
        for (var x = 0; x < aux.length; x++) {
          var aux2=aux.elementAt(x).split('-');
          //print(aux2.elementAt(1)+' '+Statics.productos.elementAt(int.parse(aux2.elementAt(0))).elementAt(0));
          price+=int.parse(Statics.productos.elementAt(int.parse(aux2.elementAt(0))).elementAt(1))*int.parse(aux2.elementAt(1));
          //print(aux2.elementAt(1)+" ");
        }
        print('precio: '+price.toString());

        return ItemOrder(client: true,onPressed: (){
          Statics.idAux = Statics.pedidos.indexOf(el);
          Navigator.pushNamed(context, '/orderDetailConsummer');
        },el: el);
      }else{
        return Container();
      }
    }).toList();
  }
}