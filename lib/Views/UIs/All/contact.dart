import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' ;

class Contact extends StatefulWidget{
  ContactState createState()=> ContactState();
}
class ContactState extends State<Contact> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Contáctanos'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ])
            ),
          ),
        ),
        body: ListView(
          //alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            children: <Widget>[ Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 30,),child: Image(image: AssetImage("assets/merkarapid-oficial.png"),height: MediaQuery.of(context).size.height*0.3,),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Card(
                        color: Colors.grey[350],
                        child: ListTile(
                          onTap: (){
                            launch("tel:3116623665");
                          },
                          leading: Icon(Icons.phone,size: 40,color: Color.fromRGBO(244, 111, 51, 1),),
                          title: Text("Teléfono",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color.fromRGBO(244, 111, 51, 1),),),
                          subtitle: Text("(311) 662 - 3665",style: TextStyle(fontStyle: FontStyle.italic)),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Card(
                        color: Colors.grey[350],
                        child: ListTile(
                          onTap: (){

                          },
                          leading: Icon(Icons.email,size: 40,color: Color.fromRGBO(244, 111, 51, 1),),
                          title: Text("E-mail",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color.fromRGBO(244, 111, 51, 1),),),
                          subtitle: Text("info@amagicsoft.com",style: TextStyle(fontStyle: FontStyle.italic),),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.only(left: 30,right: 30),
                      child: Card(
                        color: Colors.grey[350],
                        child: ListTile(
                            leading: Icon(Icons.web,size: 40,color: Color.fromRGBO(244, 111, 51, 1),),
                            title: Text("Página Web",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color.fromRGBO(244, 111, 51, 1),),),
                            subtitle: Text("www.amagicsoft.com",style: TextStyle(fontStyle: FontStyle.italic)),
                            onTap: (){

                            }
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ])
    );
  }
}