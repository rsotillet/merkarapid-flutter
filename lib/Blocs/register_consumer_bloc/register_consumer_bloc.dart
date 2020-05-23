import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:merkarapid/logics/RegisterConsumerLogic.dart';
import './bloc.dart';

class RegisterConsumerBloc extends Bloc<RegisterConsumerEvent, RegisterConsumerState> {

  final RegisterConsumerLogic logic;
  RegisterConsumerBloc({@required this.logic});

  @override
  RegisterConsumerState get initialState => InitialRegisterConsumerState();

  @override
  Stream<RegisterConsumerState> mapEventToState(
    RegisterConsumerEvent event,
  ) async* {
  }
}
