import 'package:flutter/material.dart';
import 'package:merkarapid/Views/UIs/All/TyC.dart';
import 'package:merkarapid/Views/UIs/All/contact.dart';
import 'package:merkarapid/Views/UIs/All/order_details.dart';
import 'package:merkarapid/Views/UIs/All/panel.dart';
import 'package:merkarapid/Views/UIs/Commerce/profileCommerce.dart';
import 'package:merkarapid/Views/UIs/All/registerConsumer.dart';
import 'package:merkarapid/Views/UIs/Commerce/HomeCommerce.dart';
import 'package:merkarapid/Views/UIs/Commerce/addDomiciliary.dart';
import 'package:merkarapid/Views/UIs/Commerce/addProduct.dart';
import 'package:merkarapid/Views/UIs/Commerce/domiciliary.dart';
import 'package:merkarapid/Views/UIs/Commerce/orders.dart';
import 'package:merkarapid/Views/UIs/Commerce/product.dart';
import 'package:merkarapid/Views/UIs/Consummer/commerceList.dart';
import 'package:merkarapid/Views/UIs/Consummer/consumer.dart';
import 'package:merkarapid/Views/UIs/Consummer/directions.dart';
import 'package:merkarapid/Views/UIs/Consummer/order_details_consummer.dart';
import 'package:merkarapid/Views/UIs/Consummer/ordersConsummer.dart';
import 'package:merkarapid/Views/UIs/Consummer/profileConsummer.dart';
import 'package:merkarapid/Views/UIs/Consummer/shoppingCar.dart';
import 'package:merkarapid/Views/UIs/Consummer/soat.dart';

class GeneralRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Panel());
      case '/registerConsumer':
        return MaterialPageRoute(builder: (_) =>RegisterConsumer());
      case '/consumerHome':
        return MaterialPageRoute(builder: (_) => Consumer());
      case '/commerceList':
        return MaterialPageRoute(builder: (_) => CommerceList());
      case '/commerceHome':
        return MaterialPageRoute(builder: (_) => HomeCommerce(user: settings.arguments));
      case '/order':
        return MaterialPageRoute(builder: (_) => Orders());
      case '/orderConsummer':
        return MaterialPageRoute(builder: (_) => OrdersConsummer());
      case '/orderDetail':
        return MaterialPageRoute(builder: (_) => OrderDetail());
      case '/orderDetailConsummer':
        return MaterialPageRoute(builder: (_) => OrderDetailConsummer());
      case '/domiciliary':
        return MaterialPageRoute(builder: (_) => Domiciliary());
      case '/addDomiciliary':
        return MaterialPageRoute(builder: (_) => AddDomiciliary());
      case '/products':
        return MaterialPageRoute(builder: (_) => Product(rol: settings.arguments,));
      case '/profileCommerce':
        return MaterialPageRoute(builder: (_) => ProfileCommerce());
      case '/profileConsummer':
        return MaterialPageRoute(builder: (_) => ProfileConsummer());
      case '/addproducts':
        return MaterialPageRoute(builder: (_) => AddProduct());
      case '/directions':
        return MaterialPageRoute(builder: (_) => Directions());
      case '/contact':
        return MaterialPageRoute(builder: (_) => Contact());
      case '/tyc':
        return MaterialPageRoute(builder: (_) => TyC());
      case '/shoppingCar':
        return MaterialPageRoute(builder: (_) => ShoppingCar());
      case '/soat':
        return MaterialPageRoute(builder: (_) => Soat());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('La ruta ${settings.name} no esta definida')),
            ));
    }
  }
}