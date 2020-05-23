import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merkarapid/Views/Partials/ItemOrder.dart';
import 'package:merkarapid/Views/Partials/drawerCommerce.dart';
import 'package:merkarapid/models/static.dart';
import 'package:merkarapid/models/user.dart';

class HomeCommerce extends StatefulWidget{
  final User user;

  const HomeCommerce({Key key,@required this.user}) : super(key: key);

  @override
  _HomeCommerceState createState( )=> new _HomeCommerceState();

}

class _HomeCommerceState extends State<HomeCommerce>{

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCommerce(name: widget.user.name,lastName: widget.user.lastName,email: widget.user.email),
      body: _buildBody(),
    );
  }



  _buildBody(){
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled ){
        return <Widget>[
          SliverAppBar(
            title:Text("Comercio"),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage('assets/perfil1.png')
                                      )
                                  )
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0,right: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(widget.user.role,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 18.0),),
                                Text('ID: 2107s891278',style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                child: FlatButton(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(10.0),
                                  ),
                                  onPressed: (){},
                                  disabledColor: Colors.grey,
                                  color:  Color.fromRGBO(24,169,140, 1),
                                  child: Text(
                                    "Abierto",
                                    style: TextStyle(
                                      color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                                      fontSize: 10.0,
                                    ),
                                  ),
                                ),
                              )
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
        child: ListView(
            children: Statics.pedidos.map((el){
              if(el.elementAt(3)=='0'){
                return ItemOrder(el: el,onPressed: (){
                  Statics.idAux = Statics.pedidos.indexOf(el);
                  Navigator.pushNamed(context, '/orderDetail');
                },);
              }else{
                return Container();
              }
            }).toList()
        ),
      ),
    );
  }


}