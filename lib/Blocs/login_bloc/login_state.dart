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
  // TODO: implement props
  List<Object> get props => null;
}

class LoggedInBlocState extends LoginState{
  final String token;

  final User;

  LoggedInBlocState(this.token, this.User);

  @override
  // TODO: implement props
  List<Object> get props => [token];

}

class CorrectEmailState extends LoginState{
  final String email;

  CorrectEmailState(this.email);

  @override
  // TODO: implement props
  List<Object> get props => [email];

}

class IncorrectEmailState extends LoginState{
  final String message;

  IncorrectEmailState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];

}


class ErrorBlocState extends LoginState{
  final String message;

  ErrorBlocState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];

}