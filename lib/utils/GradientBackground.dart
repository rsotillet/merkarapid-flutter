import 'package:flutter/material.dart';

class GradientBackgroundOrange extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            //Color(0XFFffbb00),
            //Color(0XFFf38c02),
            Color.fromRGBO(244, 111, 51, 1),
            Color.fromRGBO(255, 149, 2, 1),
            Color.fromRGBO(244, 189, 51, 1),
            Color.fromRGBO(255, 255, 255, 1),


          ],
          begin:  Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
    );
  }
}

class GradientBackgroundPurple extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              //Color(0XFFffbb00),
              //Color(0XFFf38c02),
              Color.fromRGBO(64,8,82, 1),
              Color.fromRGBO(136,28,170, 1),
              Color.fromRGBO(285,53,67, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            begin:  Alignment.topLeft,
            end: Alignment.bottomRight,
          )
      ),
    );
  }
}
