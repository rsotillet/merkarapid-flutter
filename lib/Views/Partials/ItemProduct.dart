import 'package:flutter/material.dart';
import 'package:merkarapid/models/static.dart';

class ItemProduct extends StatefulWidget {
  final dynamic el;

  ItemProduct({this.el});
  @override
  _ItemProductState createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: Material(
          child: Container(
            width: 300.0,
            decoration: BoxDecoration(
              //color: Color.fromRGBO(9,173,120, 1),
                color: Color.fromRGBO(180,187,185,1),
                //color: Color.fromRGBO(255,149,2,1),
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                onPressed: (){
                  //Navigator.pushNamed(context, '/orderDetail',arguments: 'PENDIENTE');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(Statics.productos.elementAt(int.parse(widget.el.elementAt(0))).elementAt(0),style: TextStyle(fontSize: 26.0,color: Colors.white),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('\$'+(int.parse(Statics.productos.elementAt(int.parse(widget.el.elementAt(0))).elementAt(1))*int.parse(widget.el.elementAt(1))).toString(),style: TextStyle(fontSize: 20.0,color: Colors.white),),
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(widget.el.elementAt(1)+' '+Statics.productos.elementAt(int.parse(widget.el.elementAt(0))).elementAt(3),style:  TextStyle(fontSize: 20.0)),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
