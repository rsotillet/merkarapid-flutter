import 'package:merkarapid/models/user.dart';

abstract class LoginLogic{
  Future<dynamic> login(String email,String password);
  Future<String> logout();
  isEmailValid(String email);
}

class LoginException implements Exception{}

class SimpleLoginLogic extends LoginLogic{
  @override
  Future<String> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if(email!='demo@demo.com' || password !="123456"){
      throw LoginException();
    }
    return "un token";
  }

  @override
  isEmailValid(String email){
    if(email.contains('@')){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<String> logout() async {
    // TODO: implement logout
    return "";
  }

}


class ExampleLoginLogic extends LoginLogic{
  @override
  isEmailValid(String email) {
    if(email.contains('@')){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<Response> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if(email=='commerce@demo.com' && password =="123456"){
      return Response('123',User(email: email,name: 'Com', lastName:'Merse', role: 'COMMERCE'));
    }else if(email=='consummer@demo.com' && password=="123456"){
      return Response('123',User(email: email,name: 'Con', lastName:'Summer', role: 'CONSUMMER'));
    }else if(email=='domiciliary@demo.com' && password =="123456"){
      return Response('123',User(email: email,name: 'Dom', lastName:'Iciliary', role: 'DOMICILIARY'));
    }else{
      throw LoginException();
    }
  }

  @override
  Future<String> logout() async {
    // TODO: implement logout
    return "";
  }

}

class Response{
  final String Token;
  final User user;
  Response(this.Token, this.user);
}