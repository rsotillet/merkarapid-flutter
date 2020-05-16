import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color background;
  final Color textColor;
  final Function onPressed;
  final String text;
  final double fontSize;

  const PrimaryButton({this.background, this.onPressed, this.text, this.textColor:Colors.white, this.fontSize:26.0});

  @override
  Widget build(BuildContext context) {
    return Material(  //Wrap with Material
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.0) ),
      elevation: 18.0,
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias, // Add This
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width-40,
        height: 60,
        disabledColor: Colors.grey,
        color: background,
        child: new Text(text,
            style: new TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold, color: textColor)),
        onPressed: onPressed,
      ),
    );
    /*
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
        shape: new RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 1.0),
          borderRadius: new BorderRadius.circular(10.0),
        ),
        onPressed:onPressed,
        disabledColor: Colors.grey,
        color: background,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
            fontSize: 26.0,
          ),
        ),
      ),),
    );*/


  }
}
