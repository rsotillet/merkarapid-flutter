import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/GradientBackground.dart';

class RegisterConsumer extends StatefulWidget {

  @override
  _RegisterConsumerState createState() => _RegisterConsumerState();
}

class _RegisterConsumerState extends State<RegisterConsumer> {

  TextEditingController
      nameController,
      lastNameController,
      cellphoneController,
      emailController,
      placeController,
      documentTypeController,
      documentNumberController,
      nameCommerceController;
  bool checkedValue;

  @override
  void initState() {
    super.initState();
    nameController=new TextEditingController();
    lastNameController=new TextEditingController();
    cellphoneController=new TextEditingController();
    emailController=new TextEditingController();
    placeController=new TextEditingController();
    documentTypeController=new TextEditingController();
    documentNumberController=new TextEditingController();
    nameCommerceController=new TextEditingController();
    checkedValue=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          fit:StackFit.loose,
          children: <Widget>[
            GradientBackgroundOrange(),
            Center(
              child:PageView(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Center(
                          child: Text(
                            "Registrate en Merkarapid",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "Accede a cientos de productos disponibles para ti",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
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
                                topLeft: Radius.elliptical( MediaQuery.of(context).size.width/2,70.0)
                            )
                        ),
                        child:Form(
                          child: Padding(
                              padding: EdgeInsets.all(40.0),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: nameController,
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
                                    controller: lastNameController,
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
                                    controller: cellphoneController,
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
                                    controller: emailController,
                                    readOnly: true,
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
                                    controller: documentTypeController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      labelText: 'Tipo de documento',
                                      prefixIcon: Icon(Icons.call_to_action),
                                    ),
                                    cursorColor: Color.fromRGBO(136,28,170, 1),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    controller: documentNumberController,
                                    readOnly: true,
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
                                    controller: nameCommerceController,
                                    readOnly: true,
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
                                    activeColor:  Color.fromRGBO(255, 149, 2, 1),
                                    secondary: IconButton(
                                      icon: Icon(Icons.info),
                                      color: Colors.orange,
                                      onPressed: (){
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                              elevation: 16.0,
                                              backgroundColor: Colors.orangeAccent,
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
                                        borderRadius: new BorderRadius.circular(10.0),
                                      ),
                                      onPressed: (){
                                        //Navigator.pop(context);
                                        //Navigator.pushReplacementNamed(context, '/');
                                      },
                                      disabledColor: Colors.grey,
                                      color:  Color.fromRGBO(255, 149, 2, 1),
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
                                    height: 50.0,
                                  ),
                                ],
                              )
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }


}