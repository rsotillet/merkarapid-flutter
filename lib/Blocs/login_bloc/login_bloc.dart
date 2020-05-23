import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:merkarapid/logics/LoginLogic.dart';
import './bloc.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginLogic logic;

  LoginBloc({@required this.logic});

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is DoLoginEvent){
      yield*_doLogin(event);
    }
    if(event is DoWriteEvent){
      yield* _doWrite(event);
    }
  }


  Stream<LoginState> _doLogin(DoLoginEvent event) async*{

    yield LogginInBlockState();
    try{
      Response result = await logic.login(event.email, event.password);
      yield LoggedInBlocState(result.token,result.user);
    }on LoginException{
      yield ErrorBlocState('No se pudo logear');
    }

  }

  Stream<LoginState> _doWrite(DoWriteEvent event) async*{

    if(logic.isEmailValid(event.email)){
      yield CorrectEmailState(event.email);
    }else{
      yield IncorrectEmailState('El email no es valido');
    }

  }
}
