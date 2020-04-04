

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merkarapid/utils/GradientBackground.dart';

class Panel extends StatefulWidget{

  @override
  _panelState createState() =>_panelState();

}

class _panelState extends State<Panel>{

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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit:BoxFit.cover
                )
            ),
          ),
          Positioned(
            child: Image(
              image: AssetImage('assets/img-logo1.png'),
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent, width: 1.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/login');
                    },
                    disabledColor: Colors.grey,
                    color:  Color.fromRGBO(255, 149, 2, .7),
                    child: Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                        color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                        fontSize: 26.0,
                      ),
                    ),
                  ),),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Ó', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 26.0),),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent, width: 1.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: (){},
                    disabledColor: Colors.grey,
                    color:  Color.fromRGBO(255, 149, 2, .7),
                    child: Text(
                      "Registrar",
                      style: TextStyle(
                        color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                        fontSize: 26.0,
                      ),
                    ),
                  ),),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent, width: 1.0),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: (){
                      Navigator.pushNamed(context, '/registerCommerce');
                    },
                    disabledColor: Colors.grey,
                    color:  Color.fromRGBO(136,28,170, .7),
                    child: Text(
                      "¿Eres Tendero?\nRegistrate Acá",
                      style: TextStyle(
                        color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                        fontSize: 18.0,
                      ),
                    ),
                  ),),
                ),
                SizedBox(
                  height: 60.0,
                ),
              ],
            ),
          )
        ],
      )
    );
  }

}