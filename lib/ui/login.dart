
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:merkarapid/blocs/login_bloc/bloc.dart';
import 'package:merkarapid/utils/GradientBackground.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();


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
                  image: AssetImage('assets/logo-merkarappi-w.png'),
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
                        Navigator.pushNamed(context, '/consumerHome');
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
                                        },
                                        icon: Icon(Icons.visibility),
                                      )
                                    ),
                                    obscureText: true,
                                    controller: passwordController,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),

                                  if(state is LogginInBlockState)
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: CircularProgressIndicator(

                                      ),
                                    )
                                  else
                                    Container(
                                      color: Colors.transparent,
                                      width: MediaQuery.of(context).size.width,
                                      height: 60,
                                      child: Padding(padding: EdgeInsets.only(left: 30,right: 30),child: FlatButton(
                                        shape: new RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white, width: 1.0),
                                          borderRadius: new BorderRadius.circular(10.0),
                                        ),
                                        onPressed: _doLogin,
                                        disabledColor: Colors.grey,
                                        color:  Color.fromRGBO(255, 149, 2, 1),
                                        child: Text(
                                          "Iniciar Sesion",
                                          style: TextStyle(
                                            color: Colors.white,//Color.fromRGBO(3, 54, 71, 0.7),
                                            fontSize: 26.0,
                                          ),
                                        ),
                                      ),),
                                    ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  InkWell(
                                    child: Text('Recuperar Clave', style: TextStyle(color:  Color.fromRGBO(255, 149, 2, 1),fontWeight: FontWeight.bold,decoration: TextDecoration.underline),),
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
  void _doLogin(){
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
          content: Text(message),
        )
    );
  }
}
