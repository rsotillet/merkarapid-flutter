import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/ItemOrder.dart';
import 'package:merkarapid/models/static.dart';

class Orders extends StatefulWidget{
  @override
  _OrdersState createState()=>_OrdersState();

}

class _OrdersState extends State<Orders>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pedidos'),
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
                text: 'Pendientes',
                icon: Icon(Icons.add_to_home_screen),
              ),
              Tab(
                text: 'En Proceso',
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                text: 'Entregado',
                icon: Icon(Icons.check_circle_outline),
              ),
              Tab(
                text: 'Cancelados',
                icon: Icon(Icons.not_interested),
              ),
            ],
          ),
        ),
        body: TabBarView(
            children: <Widget>[
              ListView(
                children: _buildListItem2('0'),
              ),
              ListView(
                children: _buildListItem2('1'),
              ),
              ListView(
                children: _buildListItem2('2'),
              ),
              ListView(
                children: _buildListItem2('3'),
              )
            ]
        ),
      ),
    );
  }
  
  List<Widget>_buildListItem2(String status){
    return Statics.pedidos.map((el){
      if(el.elementAt(3)==status){
        return ItemOrder(el: el,onPressed: (){
          Statics.idAux = Statics.pedidos.indexOf(el);
          Navigator.pushNamed(context, '/orderDetail');
        },);
      }else{
        return Container();
      }
    }).toList();
  }
}