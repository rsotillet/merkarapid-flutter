import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merkarapid/logics/LoginLogic.dart';
import 'package:merkarapid/ui/commerce.dart';
import 'package:merkarapid/ui/consumer.dart';
import 'package:merkarapid/ui/panel.dart';
import 'package:merkarapid/ui/login.dart';
import 'package:merkarapid/ui/registerCommerce.dart';
import 'package:merkarapid/ui/registerConsumer.dart';
import 'blocs/login_bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Merkarapid',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
     initialRoute: '/',
      routes: {
        '/':(context)=>Panel(),
        '/registerConsumer':(context)=>RegisterConsumer(),
        '/registerCommerce':(context)=>RegisterCommerce(),
        '/consumerHome':(context)=>Consumer(),
        '/commerceHome':(context)=>Commerce(),
        '/login':(context)=>
            BlocProvider(
              builder: (_)=> LoginBloc(
                  logic: SimpleLoginLogic()
              ),
              child: Login(
                  title: 'Merkarapid'
              ),
            ),

      },
    );
  }
}
