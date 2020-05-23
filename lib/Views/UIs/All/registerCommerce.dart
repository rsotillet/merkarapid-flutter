import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/GradientBackground.dart';
import 'package:merkarapid/Views/Partials/ShowOptions.dart';

class RegisterCommerce extends StatefulWidget{
  @override
  _RegisterCommerceState createState() => _RegisterCommerceState();

}

class _RegisterCommerceState extends State<RegisterCommerce>{

  TextEditingController documentTypeController;
  TextEditingController placeController;
  PageController _pageController;
  bool checkedValue;
  File imageFile;

  @override
  void initState() {
    super.initState();
    documentTypeController=new TextEditingController();
    placeController=new TextEditingController();
    _pageController=new PageController();
    checkedValue=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit:StackFit.loose,
        children: <Widget>[
          GradientBackgroundPurple(),
          Center(
            child:PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        "Registrar Comercio",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 15,
                              child: Text('1',style: TextStyle(color: Colors.white),),
                              backgroundColor: Color.fromRGBO(136,28,170, 1),
                            ),
                            Container(
                              width: 50.0,
                              height: 5.0,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(136,28,170, 1)),
                                value: 0,
                              ),
                            ),
                            CircleAvatar(
                              radius: 15,
                              child: Text('2',style: TextStyle(color: Colors.white),),
                              backgroundColor: Colors.grey,
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              //topRight: Radius.elliptical( MediaQuery.of(context).size.width/2,70.0),
                              topLeft: Radius.elliptical( MediaQuery.of(context).size.width/2,70.0)
                          )
                      ),
                      child:Form(
                        child: Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              children: <Widget>[
                                _setImageView(),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Nombre',
                                    prefixIcon: Icon(Icons.person),
                                  ),
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Apellido',
                                    prefixIcon: Icon(Icons.person_outline),
                                  ),
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Numero Celular',
                                    prefixIcon: Icon(Icons.phone_android),
                                  ),
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Correo Electrónico',
                                    prefixIcon: Icon(Icons.alternate_email),
                                  ),
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Contraseña',
                                    prefixIcon: Icon(Icons.lock),
                                  ),
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Confirmar contraseña',
                                    prefixIcon: Icon(Icons.lock_outline),
                                  ),
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
                                    shape: new RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white, width: 1.0),
                                      borderRadius: new BorderRadius.circular(10.0),
                                    ),
                                    onPressed: (){
                                      _pageController.animateToPage(1, duration: Duration(milliseconds: 2000),curve: Curves.bounceOut);
                                    },
                                    disabledColor: Colors.grey,
                                    color:  Color.fromRGBO(136,28,170, 1),
                                    child: Text(
                                      "Continuar",
                                      style: TextStyle(
                                        color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                                        fontSize: 26.0,
                                      ),
                                    ),
                                  ),),
                                )
                              ],
                            )
                        ),
                      ),
                    )
                  ],
                ),
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        "Registrar Comercio",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 15,
                              child: Text('1',style: TextStyle(color: Colors.white),),
                              backgroundColor: Color.fromRGBO(136,28,170, 1),
                            ),
                            Container(
                              width: 50.0,
                              height: 5.0,
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.grey,
                                valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(136,28,170, 1)),
                                value: 1,
                              ),
                            ),
                            CircleAvatar(
                              radius: 15,
                              child: Text('2',style: TextStyle(color: Colors.white),),
                              backgroundColor: Color.fromRGBO(136,28,170, 1),
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.elliptical( MediaQuery.of(context).size.width/2,70.0),
                              //topLeft: Radius.elliptical( MediaQuery.of(context).size.width/2,70.0)
                          )
                      ),
                      child:Form(
                        child: Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: placeController,
                                  decoration: InputDecoration(
                                    labelText: 'Seleccione Plaza',
                                    prefixIcon: Icon(Icons.place),
                                    suffixIcon: Icon(Icons.arrow_drop_down)
                                  ),
                                  onTap: (){
                                    ShowOptions.showManyOptions(placeController,context,[
                                      'Restrepo',
                                      'Santa Fe',
                                    ]);
                                  },
                                  readOnly: true,
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  controller: documentTypeController,
                                  decoration: InputDecoration(
                                    labelText: 'Tipo de documento',
                                    prefixIcon: Icon(Icons.call_to_action),
                                      suffixIcon: Icon(Icons.arrow_drop_down)
                                  ),
                                  onTap: (){
                                    ShowOptions.showManyOptions(documentTypeController,context,[
                                      'Cédula de Ciudadanía',
                                      'Cédula de Extrangería',
                                      'Pasaporte',
                                      'Nit'
                                    ]);
                                  },
                                  readOnly: true,
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Numero de documento',
                                    prefixIcon: Icon(Icons.account_box),
                                  ),
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Nombre del comercio',
                                    prefixIcon: Icon(Icons.home),
                                  ),
                                  cursorColor: Color.fromRGBO(136,28,170, 1),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                CheckboxListTile(
                                  title: Text("Acepto Terminos y condiciones"), //    <-- label
                                  value: checkedValue,
                                  activeColor:  Color.fromRGBO(136,28,170, 1),
                                  secondary: IconButton(
                                    icon: Icon(Icons.info),
                                    color: Color.fromRGBO(136,28,170, 1),
                                    onPressed: (){
                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                            elevation: 16.0,
                                            backgroundColor: Color.fromRGBO(136,28,170, 1),
                                            content: Text("Aceptar los terminos y condiciones son necesarios para poder usar Mercarapid",textAlign:TextAlign.center,),
                                            action: SnackBarAction(
                                              label: 'Ver T&C',
                                              textColor: Colors.black,
                                              onPressed: (){
                                                Navigator.pushNamed(context, '/tyc');
                                              },
                                            ),
                                          )
                                      );
                                    },
                                  ),
                                  onChanged: (newValue) {
                                    setState(() {
                                      checkedValue=newValue;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Container(
                                  color: Colors.transparent,
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
                                    shape: new RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.white, width: 1.0),
                                      borderRadius: new BorderRadius.circular(10.0),
                                    ),
                                    onPressed: (){
                                      //Navigator.pop(context);
                                      //Navigator.pushReplacementNamed(context, '/commerceHome');
                                    },
                                    disabledColor: Colors.grey,
                                    color:  Color.fromRGBO(136,28,170, 1),
                                    child: Text(
                                      "Continuar",
                                      style: TextStyle(
                                        color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                                        fontSize: 26.0,
                                      ),
                                    ),
                                  ),),
                                ),
                                SizedBox(
                                  height: 50.0,
                                ),
                              ],
                            )
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _setImageView() {
    if (imageFile != null) {
      return Material(
        elevation: 4.0,
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: Ink.image(
          image: Image.file(imageFile).image,
          fit: BoxFit.cover,
          width: 120.0,
          height: 120.0,
          child: InkWell(
            onTap: ()async {
              imageFile=await ShowOptions.showSelectPicture(context, imageFile,Color.fromRGBO(136,28,170, 1),true);
              setState(() {});
            },
          ),
        ),
      );
    } else {
      return Material(
        elevation: 4.0,
        shape: CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage('assets/perfil1.png'),
          fit: BoxFit.cover,
          width: 120.0,
          height: 120.0,
          child: InkWell(
            onTap: () async{
              imageFile=await ShowOptions.showSelectPicture(context, imageFile,Color.fromRGBO(136,28,170, 1),false);
              setState(() {});
            }
          ),
        ),
      );
    }
  }
}


