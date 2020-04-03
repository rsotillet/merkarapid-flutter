import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget{
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
