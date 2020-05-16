
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merkarapid/Views/Partials/GradientBackground.dart';
import 'package:merkarapid/Views/Partials/primariButton.dart';
import 'package:merkarapid/blocs/login_bloc/bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController;
  TextEditingController passwordController;
  bool showPassword;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    showPassword=false;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: <Widget>[
          GradientBackgroundOrange(),
          Center(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/merkarapid-oficial-w.png'),
                  width: 300.0,
                  height: 300.0,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height/2)+70.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical( MediaQuery.of(context).size.width/2,70.0),
                    topLeft: Radius.elliptical( MediaQuery.of(context).size.width/2,70.0)
                )
              ),
              child: ListView(
                children: <Widget>[
                  BlocListener<LoginBloc,LoginState>(
                    listener: (context,state){
                      if(state is ErrorBlocState){
                        _showError(context,state.message);
                      }
                      if(state is LoggedInBlocState){
                        if(state.User.role=="COMMERCE"){
                          //Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/commerceHome', arguments: state.User);
                        }
                      }
                      if(state is LoggedInBlocState){
                        if(state.User.role=="CONSUMMER"){
                          //Navigator.pop(context);
                          Navigator.pushReplacementNamed(context, '/consumerHome', arguments: state.User);
                        }
                      }
                    },
                    child: BlocBuilder<LoginBloc,LoginState>(
                      builder: (context,state){
                        return Form(
                          child: Padding(
                            padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Correo Electrónico o Teléfono',
                                        prefixIcon: Icon(Icons.alternate_email),
                                    ),
                                    controller: emailController,
                                    cursorColor: Colors.orange,
                                    onChanged: _doWriteEmail,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        labelText: 'Clave',
                                        prefixIcon: Icon(Icons.lock_outline),
                                      suffixIcon: IconButton(
                                        onPressed: (){
                                          setState(() {
                                            showPassword=!showPassword;
                                          });
                                        },
                                        icon: Icon(showPassword?Icons.visibility_off:Icons.visibility),
                                      )
                                    ),
                                    obscureText: !showPassword,
                                    controller: passwordController,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  if(state is LogginInBlockState)
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: CircularProgressIndicator(backgroundColor: Colors.white, valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(244, 111, 51, 1),),),
                                    )
                                  else
                                    PrimaryButton(onPressed: _doLogin,background: Color.fromRGBO(244, 111, 51, 1),text: 'Iniciar Sesión',),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  InkWell(
                                    child: Text('Recuperar Clave', style: TextStyle(color: Color.fromRGBO(244, 111, 51, 1),fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
                                    onTap: (){},
                                  )
                                ],
                              )
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  _doLogin(){
    BlocProvider.of<LoginBloc>(context)
        .add(DoLoginEvent(emailController.text,passwordController.text));
  }

  _doWriteEmail(email){
    BlocProvider.of<LoginBloc>(context)
        .add(DoWriteEvent(email));
  }

  _showError(BuildContext context, String message){
    Scaffold.of(context).showSnackBar(
        SnackBar(
          elevation: 16.0,
          backgroundColor: Colors.orangeAccent,
          content: Text(message,textAlign:TextAlign.center,),
        )
    );
  }
}
