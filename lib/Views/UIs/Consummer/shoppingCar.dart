import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merkarapid/Views/Partials/ShowOptions.dart';
import 'package:merkarapid/models/static.dart';

class ShoppingCar extends StatefulWidget{

  @override
  _shoppingCarState createState( )=> new _shoppingCarState();

}

class _shoppingCarState extends State<ShoppingCar>{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _buildBody(),
    );
  }


  _buildBody(){
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled ){
        return <Widget>[
          SliverAppBar(
            title:Text("Carrito de compras"),
            backgroundColor: Color.fromRGBO(255, 149, 2, 1),
            //expandedHeight: MediaQuery.of(context).size.height,
            expandedHeight: MediaQuery.of(context).size.height/3,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          gradient:  LinearGradient(
                              colors:  <Color>[
                                Color.fromRGBO(244, 111, 51, 1),
                                Color.fromRGBO(255, 149, 2, 1)
                              ]),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/merkarapid-oficial-w.png'),
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.contain,
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
          //color: Colors.white,
        ),
        child: ListView(
          children: <Widget>[
            Column(
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
                      subtitle: Text('1 '+el.elementAt(3),style: TextStyle(color: Colors.white)),
                      trailing: Text('\$'+el.elementAt(1),style: TextStyle(color: Colors.white)),
                      onTap: (){
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
                shape: new RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white, width: 1.0),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                onPressed: ()async {
                  //Navigator.pop(context);
                  //Navigator.pushReplacementNamed(context, '/');
                    bool confirm =await ShowOptions.showConfirm(context, 'Ordenar Pedido', 'Desea realizar la compra por \$999.999',Color.fromRGBO(244, 111, 51, 1));
                    if(confirm){
                      ShowOptions.showAlert(context, 'Pedido Realizado con exito', 'En momentos estara recibiendo los pedidos en la puerta de su hogar', Color.fromRGBO(244, 111, 51, 1));
                    }
                  },
                disabledColor: Colors.grey,
                color: Color.fromRGBO(244, 111, 51, 1),
                child: Text(
                  "Ordenar",
                  style: TextStyle(
                    color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                    fontSize: 26.0,
                  ),
                ),
              ),),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],

          /*Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                      "Nuevos Pedidos",style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.bold,color:Colors.grey[400], decoration: TextDecoration.none)),
                ),
              ),*/


        ),
      ),
    );
  }


}