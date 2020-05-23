import 'package:flutter/material.dart';
import 'package:merkarapid/Views/Partials/ShowOptions.dart';
import 'package:merkarapid/Views/Partials/primariButton.dart';
import 'package:merkarapid/models/static.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController categoryController,
      nameController,
      priceController,
      offerController,
      unitTypeController;

  @override
  void initState() {
    super.initState();
    categoryController = new TextEditingController();
    unitTypeController = new TextEditingController();
    nameController = new TextEditingController();
    priceController = new TextEditingController();
    offerController = new TextEditingController();

    if (Statics.editidAux != -1) {
      nameController.text =
          Statics.productos.elementAt(Statics.editidAux).elementAt(0);
      priceController.text =
          Statics.productos.elementAt(Statics.editidAux).elementAt(1);
      categoryController.text =
          Statics.productos.elementAt(Statics.editidAux).elementAt(2);
      unitTypeController.text =
          Statics.productos.elementAt(Statics.editidAux).elementAt(3);
      offerController.text =
          Statics.productos.elementAt(Statics.editidAux).elementAt(4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Agregar Producto"),
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
                      prefixIcon: Icon(Icons.group_work),
                    ),
                    controller: nameController,
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: priceController,
                    decoration: InputDecoration(
                      labelText: 'Precio unitario',
                      prefixIcon: Icon(Icons.monetization_on),
                    ),
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: categoryController,
                    decoration: InputDecoration(
                        labelText: 'Categoria del Producto',
                        prefixIcon: Icon(Icons.category),
                        suffixIcon: Icon(Icons.arrow_drop_down)),
                    onTap: () {
                      ShowOptions.showManyOptions(categoryController, context,
                          ['Carnes', 'Verduras', 'Frutas', 'Lacteos']);
                    },
                    readOnly: true,
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: unitTypeController,
                    decoration: InputDecoration(
                        labelText: 'Tipo de Unidad',
                        prefixIcon: Icon(Icons.fiber_manual_record),
                        suffixIcon: Icon(Icons.arrow_drop_down)),
                    onTap: () {
                      ShowOptions.showManyOptions(unitTypeController, context, [
                        'Unidad',
                        'Libra',
                        'Litro',
                        'Metro',
                        'Paquete',
                        'Saco'
                      ]);
                    },
                    readOnly: true,
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: offerController,
                    decoration: InputDecoration(
                      labelText: 'Precio con descuento',
                      prefixIcon: Icon(Icons.local_offer),
                    ),
                    cursorColor: Color.fromRGBO(136, 28, 170, 1),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(
                    onPressed: () {
                      if (Statics.editidAux != -1) {
                        _updateProduct();
                      } else {
                        _addProduct();
                      }
                    },
                    text: (Statics.editidAux == -1) ? "Agregar" : "Actualizar",
                    background: Color.fromRGBO(136, 28, 170, 1),
                  )
                ],
              ))
        ],
      ),
    );
  }

  _addProduct() {
    Statics.productos.add([
      nameController.text,
      priceController.text,
      categoryController.text,
      unitTypeController.text,
      offerController.text
    ]);
    _cleanInputs();
  }

  _updateProduct() {
    Statics.productos.elementAt(Statics.editidAux).replaceRange(0, 5, [
      nameController.text,
      priceController.text,
      categoryController.text,
      unitTypeController.text,
      offerController.text
    ]);
    _cleanInputs();
  }

  _cleanInputs() {
    categoryController.text = "";
    unitTypeController.text = "";
    nameController.text = "";
    priceController.text = "";
    offerController.text = "";
    Navigator.pop(context);
  }
}
