import 'package:flutter/material.dart';
import 'package:merkarapid/models/static.dart';

class DrawerCommerce extends StatelessWidget {
  final String name;
  final String lastName;
  final String email;

  const DrawerCommerce({Key key, this.name, this.lastName, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(name+" "+lastName,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16.0),),
            accountEmail: Text(email,style: TextStyle(color: Colors.white),),
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ]),
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    colorFilter: ColorFilter.mode(Color.fromRGBO(68,4,68, .6), BlendMode.multiply),
                    fit: BoxFit.cover
                )
            ),
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Cuenta', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.account_box, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profileCommerce');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Pedidos', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.shopping_basket, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/order');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Productos', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.group_work, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/products');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),/*
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Inventario', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.assignment, color: Colors.white,),
              onTap:() { },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Ventas', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.trending_up, color: Colors.white,),
              onTap:() { },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),*/
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Domiciliarios', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.directions_bike, color: Colors.white,),
              onTap:() {
                Statics.idAux=-1;
                Navigator.pop(context);
                Navigator.pushNamed(context, '/domiciliary');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(64,8,82, 1),
                      Color.fromRGBO(136,28,170, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Cerrar sesion', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.close, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Center(
            child:Container(
                width: 150.0,
                height: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/fromAmsoft.png')
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}
