import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage("assets/merkarapid-oficial.png"),height: MediaQuery.of(context).size.height*0.2,),
                SizedBox(height: 10,),
                CircularProgressIndicator(backgroundColor: Colors.white, valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(244, 111, 51, 1),),),
                SizedBox(height: 10,),
                Text("Comprobando sesion..."),
              ],
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 20.0,
            child: Center(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/fromAmsoft2.png'),
                    width: 150.0,
                    height:150.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            )
          )
        ],
      )
    );
  }


}