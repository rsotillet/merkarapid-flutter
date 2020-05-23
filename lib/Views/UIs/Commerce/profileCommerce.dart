
import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/GradientBackground.dart';
import 'package:merkarapid/Views/Partials/primariButton.dart';

class ProfileCommerce extends StatefulWidget {

  @override
  _ProfileCommerceState createState() => _ProfileCommerceState();
}

class _ProfileCommerceState extends State<ProfileCommerce> {

  TextEditingController
    nameController,
    lastNameController,
    cellphoneController,
    emailController,
    placeController,
    documentTypeController,
    documentNumberController,
    nameCommerceController;

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

    nameController.text='Ronny';
    lastNameController.text='Sotillet';
    cellphoneController.text='3116623665';
    emailController.text='rsotillet@gmail.com';
    placeController.text='RESTREPO';
    documentTypeController.text='Cédula de Ciudadanía';
    documentNumberController.text='25840504';
    nameCommerceController.text='AmagicSoft';
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
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Row(children: <Widget>[
                        IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),
                          onPressed: (){
                            Navigator.pop(context);
                          },)
                      ],),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Center(
                          child: Text(
                            "Datos de la Cuenta",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0
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
                                    readOnly: true,
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
                                    readOnly: true,
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
                                    controller: placeController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        labelText: 'Seleccione Plaza',
                                        prefixIcon: Icon(Icons.place),
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
                                  PrimaryButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    text: 'Volver',
                                    background: Color.fromRGBO(136,28,170, 1),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  PrimaryButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(context, '/');
                                    },
                                    text: 'Cerrar Sesion',
                                    background: Color.fromRGBO(136,28,170, 1),
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