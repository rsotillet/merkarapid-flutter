

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merkarapid/Views/Partials/primariButton.dart';
import 'package:merkarapid/blocs/login_bloc/login_bloc.dart';
import 'package:merkarapid/blocs/register_commerce_bloc/bloc.dart';
import 'package:merkarapid/blocs/register_consumer_bloc/bloc.dart';
import 'package:merkarapid/logics/LoginLogic.dart';
import 'package:merkarapid/logics/RegisterCommerceLogic.dart';
import 'package:merkarapid/logics/RegisterConsumerLogic.dart';
import 'package:merkarapid/Views/UIs/All/SplashScreen.dart';
import 'package:merkarapid/Views/UIs/All/registerCommerce.dart';
import 'package:merkarapid/Views/UIs/All/registerConsumer.dart';
import 'package:merkarapid/models/enums.dart';

import 'login.dart';

class Panel extends StatefulWidget{

  @override
  _PanelState createState() =>_PanelState();

}

class _PanelState extends State<Panel>{

  double splashOpacity;
  bool showSlash;
  PageController _controllerViewer;
  PanelTypeAction typeAction;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    splashOpacity=1.0;
    showSlash=true;
    typeAction=PanelTypeAction.PRINCIPAL;
    _controllerViewer=new PageController();
    new Timer(const Duration(seconds: 5),()async{
          new Timer(const Duration(milliseconds: 1500),()async{
            setState(() {
              showSlash=false;
            });
          });
          setState(() {
            splashOpacity=0;
          });
    });
  }


  @override
  Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: ()async{
          if(typeAction!=PanelTypeAction.PRINCIPAL){
            await _controllerViewer.animateToPage(0, duration: Duration(milliseconds: 1500),curve: Curves.bounceOut);
            setState(() {
              typeAction=PanelTypeAction.PRINCIPAL;
            });
            return false;
          }
          return true;
        },
        child: Scaffold(
            body: PageView(
              controller: _controllerViewer,
              physics:NeverScrollableScrollPhysics(),
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      decoration:BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              //Color(0XFFffbb00),
                              //Color(0XFFf38c02),
                              Color.fromRGBO(244, 111, 51, 1),
                              Color.fromRGBO(255, 149, 2, 1),
                              Color.fromRGBO(255, 149, 2, 1),
                            ],
                            begin:  Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          image: DecorationImage(
                              image: AssetImage('assets/bg-vf4.png'),
                              fit:BoxFit.cover
                          )
                      ),
                      /*decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit:BoxFit.cover
                )
            ),*/
                    ),
                    Positioned(
                      child: Image(
                        image: AssetImage('assets/merkarapid-bgw-br.png'),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      ),
                      bottom: 0.0,
                      right: 0.0,
                    ),
                    Positioned(
                      top: 70.0,
                      child: Column(
                        children: <Widget>[

                          Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 0.0),
                            child: PrimaryButton(
                              onPressed: ()async {
                                setState(() {
                                  typeAction=PanelTypeAction.LOGIN;
                                });
                                await _controllerViewer.animateToPage(1, duration: Duration(milliseconds: 1500),curve: Curves.bounceOut);
                              },
                              background: Colors.white,
                              text: 'Inicia Sesión',
                              textColor: Colors.orange,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 0.0),
                            child: PrimaryButton(
                              onPressed: () async{
                                setState(() {
                                  typeAction=PanelTypeAction.REGISTER_CONSUMER;
                                });
                                await _controllerViewer.animateToPage(1, duration: Duration(milliseconds: 1500),curve: Curves.bounceOut);
                                //Navigator.pushNamed(context, '/registerConsumer');
                              },
                              background: Colors.white,
                              text: 'Registrate',
                              textColor: Colors.orange,
                            )
                          ),
                          SizedBox(
                            height: 100.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 0.0),
                            child:PrimaryButton(
                              onPressed: ()async {
                                setState(() {
                                  typeAction=PanelTypeAction.REGISTER_COMMERCE;
                                });
                                await _controllerViewer.animateToPage(1, duration: Duration(milliseconds: 1500),curve: Curves.bounceOut);
                                //Navigator.pushNamed(context, '/registerCommerce');
                              },
                              background: Colors.white,
                              text: "¿Eres Tendero?\nRegistrate Acá",
                              fontSize: 18.0,
                              textColor: Color.fromRGBO(136,28,170, 1),
                            )
                          )
                        ],
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(milliseconds: 1000),
                      opacity: splashOpacity,
                      curve: Curves.easeInExpo,
                      child: showSlash?SplashScreen():Container(),
                    )
                  ],
                ),
                _showSecondPage()
              ],
            )
        ),
      );
  }


  _showSecondPage(){
    if(typeAction==PanelTypeAction.LOGIN){
      return BlocProvider(
        builder: (_)=> LoginBloc(
            logic: ExampleLoginLogic()
        ),
        child: Login(), create: (BuildContext context) {},
      );
    }else if(typeAction==PanelTypeAction.REGISTER_CONSUMER) {
      return BlocProvider(
        builder: (_)=>RegisterConsumerBloc(
          logic: SimpleRegisterConsumerLogic()
        ),
        child: RegisterConsumer(), create: (BuildContext context) {},
      );
    }else if(typeAction==PanelTypeAction.REGISTER_COMMERCE) {
      return BlocProvider(
        builder: (_)=>RegisterCommerceBloc(
            logic: SimpleRegisterCommerceLogic()
        ),
        child: RegisterCommerce(), create: (BuildContext context) {},
      );
    }else{
      return Container();
    }
  }

}