import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/ShowOptions.dart';
import 'package:merkarapid/Views/Partials/primariButton.dart';
import 'package:merkarapid/models/static.dart';

class AddDomiciliary extends StatefulWidget {
  @override
  _addDomiciliaryState createState() => _addDomiciliaryState();
}

class _addDomiciliaryState extends State<AddDomiciliary> {
  TextEditingController documentTypeController,
      lastNameController,
      documentController,
      cellphoneController,
      emailController,
      nameController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    documentTypeController = new TextEditingController();
    lastNameController = new TextEditingController();
    documentController = new TextEditingController();
    cellphoneController = new TextEditingController();
    emailController = new TextEditingController();
    nameController = new TextEditingController();
    if (Statics.editidAux != -1) {
      nameController.text =
          Statics.domiciliarios.elementAt(Statics.editidAux).elementAt(0);
      lastNameController.text =
          Statics.domiciliarios.elementAt(Statics.editidAux).elementAt(1);
      documentTypeController.text =
          Statics.domiciliarios.elementAt(Statics.editidAux).elementAt(2);
      documentController.text =
          Statics.domiciliarios.elementAt(Statics.editidAux).elementAt(3);
      cellphoneController.text =
          Statics.domiciliarios.elementAt(Statics.editidAux).elementAt(4);
      emailController.text =
          Statics.domiciliarios.elementAt(Statics.editidAux).elementAt(5);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Agregar Domiciliario"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color.fromRGBO(64, 8, 82, 1),
                Color.fromRGBO(136, 28, 170, 1),
              ])),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      prefixIcon: Icon(Icons.person),
                    ),
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                    controller: nameController,
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
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: documentTypeController,
                    decoration: InputDecoration(
                        labelText: 'Tipo de documento',
                        prefixIcon: Icon(Icons.call_to_action),
                        suffixIcon: Icon(Icons.arrow_drop_down)),
                    onTap: () {
                      ShowOptions.showManyOptions(
                          documentTypeController, context, [
                        'Cedula de ciudadanía',
                        'Cedula de extrangería',
                        'Pasaporte',
                        'Permiso Especial'
                      ]);
                    },
                    readOnly: true,
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: documentController,
                    decoration: InputDecoration(
                      labelText: 'Numero de documento',
                      prefixIcon: Icon(Icons.account_box),
                    ),
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
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
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      prefixIcon: Icon(Icons.alternate_email),
                    ),
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      if (Statics.editidAux != -1) {
                        _updateDomiciliary();
                      } else {
                        _addDomiciliary();
                      }
                    },
                    text: (Statics.editidAux == -1) ? "Agregar" : "Actualizar",
                    background: Color.fromRGBO(136, 28, 170, 1),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  _addDomiciliary() {
    Statics.domiciliarios.add([
      nameController.text,
      lastNameController.text,
      documentTypeController.text,
      documentController.text,
      cellphoneController.text,
      emailController.text
    ]);
    _cleanInputs();
  }

  _updateDomiciliary() {
    Statics.domiciliarios.elementAt(Statics.editidAux).replaceRange(0, 6, [
      nameController.text,
      lastNameController.text,
      documentTypeController.text,
      documentController.text,
      cellphoneController.text,
      emailController.text
    ]);
    _cleanInputs();
  }

  _cleanInputs() {
    documentTypeController.text = '';
    lastNameController.text = '';
    documentController.text = '';
    cellphoneController.text = '';
    emailController.text = '';
    nameController.text = '';
    Navigator.pop(context);
  }
}
