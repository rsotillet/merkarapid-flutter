import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ShowOptions{

  static showManyOptions(TextEditingController tec,BuildContext context,List<String> places)async{
    await showDialog(
      context: context,
      builder:(b){
        return SimpleDialog(
            children: <Widget>[
              Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: places.map((e){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                title: Text(e,style: TextStyle(fontStyle: FontStyle.italic,fontSize: 22)),
                                onTap: (){
                                  tec.value=TextEditingValue(text:e);
                                  Navigator.pop(context);}
                            ),
                            if(e!=places[places.length-1])
                              Divider(color: Colors.blueGrey,)

                          ],
                        );}
                      ).toList()
                  )
              ),
            ]);
      },
    );
    // ignore: unrelated_type_equality_checks
  }

  static Future<bool> showConfirm(BuildContext context,String title,String body, Color color)async{
    bool respt=false;
    await showDialog(
      context: context,
      builder:(b){
        return SimpleDialog(
          title: Text(title),
            children: <Widget>[
              Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(body),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: <Widget>[
                           Container(
                               color: Colors.transparent,
                               child: FlatButton(
                                 shape: new RoundedRectangleBorder(
                                   side: BorderSide(color: Colors.black, width: 1.0),
                                   borderRadius: new BorderRadius.circular(10.0),
                                 ),
                                 onPressed: (){
                                    respt=false;
                                    Navigator.pop(context);
                                    },
                                 disabledColor: Colors.grey,
                                 color:  Colors.white,
                                 child: Text(
                                   "Cancelar",
                                   style: TextStyle(//Color.fromRGBO(3, 54, 71, 0.7),
                                     fontSize: 16.0,
                                   ),
                                 ),
                               )
                           ),
                           Container(
                               color: Colors.transparent,
                               child: FlatButton(
                                 shape: new RoundedRectangleBorder(
                                   borderRadius: new BorderRadius.circular(10.0),
                                 ),
                                 onPressed: (){
                                     respt=true;
                                     Navigator.pop(context);
                                 },
                                 disabledColor: Colors.grey,
                                 color:  color,
                                 child: Text(
                                   "Aceptar",
                                   style: TextStyle(
                                     color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                                     fontSize: 16.0,
                                   ),
                                 ),
                               )
                           ),
                         ],
                        )
                      ],
                  )
              ),
            ]);
      },
    );
    return respt;
    // ignore: unrelated_type_equality_checks
  }

  static showAlert(BuildContext context,String title,String body, Color color)async{
    await showDialog(
      context: context,
      builder:(b){
        return SimpleDialog(
            title: Text(title),
            children: <Widget>[
              Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(body),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              color: Colors.transparent,
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                disabledColor: Colors.grey,
                                color:  color,
                                child: Text(
                                  "Aceptar",
                                  style: TextStyle(
                                    color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                                    fontSize: 16.0,
                                  ),
                                ),
                              )
                          ),
                        ],
                      )
                    ],
                  )
              ),
            ]);
      },
    );
  }

  static Future<File> showSelectPicture(BuildContext context, File previewFile, Color color,bool delete)async {
    File image=previewFile;
    await showDialog(
      barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
      return SimpleDialog(
          title: Text('Seleccione una Opcion'),
          children: <Widget>[
            Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        onPressed: () async{
                          image=await _openGallery(context);
                          Navigator.pop(context);
                        },
                        disabledColor: Colors.grey,
                        color: color,
                        child: Text(
                          "Galeria",
                          style: TextStyle(
                            color: Colors.white,
                            //Color.fromRGBO(3, 54, 71, 0.7),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                        title: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: ()async {
                            image=await _openCamera(context);
                            Navigator.pop(context);
                          },
                          disabledColor: Colors.grey,
                          color: color,
                          child: Text(
                            "Camara",
                            style: TextStyle(
                              color: Colors.white,
                              //Color.fromRGBO(3, 54, 71, 0.7),
                              fontSize: 16.0,
                            ),
                          ),
                        )
                    ),
                    if(delete)
                      ListTile(
                          title: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              image=null;
                              Navigator.pop(context);
                            },
                            disabledColor: Colors.grey,
                            color: color,
                            child: Text(
                              "Borrar",
                              style: TextStyle(
                                color: Colors.white,
                                //Color.fromRGBO(3, 54, 71, 0.7),
                                fontSize: 16.0,
                              ),
                            ),
                          )
                      ),
                    ListTile(
                        title: FlatButton(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          disabledColor: Colors.grey,
                          color: color,
                          child: Text(
                            "Cancelar",
                            style: TextStyle(
                              color: Colors.white,
                              //Color.fromRGBO(3, 54, 71, 0.7),
                              fontSize: 16.0,
                            ),
                          ),
                        )
                    ),
                  ],
                )
            ),
          ]);
    });
    return image;

  }

  static Future<File> _openGallery(BuildContext context) async {
    try{
      var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
      return picture;
    }catch(e){
      print(e);
      return null;
    }

  }

  static Future<File> _openCamera(BuildContext context) async {
    try {
      var picture = await ImagePicker.pickImage(source: ImageSource.camera);
      return picture;
    }catch(e){
      print(e);
      return null;
    }
  }
}