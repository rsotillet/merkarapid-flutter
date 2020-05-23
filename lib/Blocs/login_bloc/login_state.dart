import 'package:equatable/equatable.dart';
import 'package:merkarapid/models/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}


class LogginInBlockState extends LoginState{
  @override
  List<Object> get props => null;
}

class LoggedInBlocState extends LoginState{
  final String token;
  final User user;

  LoggedInBlocState(this.token, this.user);

  @override
  List<Object> get props => [token];

}

class CorrectEmailState extends LoginState{
  final String email;

  CorrectEmailState(this.email);

  @override
  
  List<Object> get props => [email];

}

class IncorrectEmailState extends LoginState{
  final String message;

  IncorrectEmailState(this.message);

  @override
  
  List<Object> get props => [message];

}


class ErrorBlocState extends LoginState{
  final String message;

  ErrorBlocState(this.message);

  @override
  
  List<Object> get props => [message];

}