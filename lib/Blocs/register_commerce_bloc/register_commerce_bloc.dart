import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:merkarapid/logics/RegisterCommerceLogic.dart';
import './bloc.dart';

class RegisterCommerceBloc extends Bloc<RegisterCommerceEvent, RegisterCommerceState> {
  final RegisterCommerceLogic logic;
  RegisterCommerceBloc({@required this.logic});

  @override
  RegisterCommerceState get initialState => InitialRegisterCommerceState();

  @override
  Stream<RegisterCommerceState> mapEventToState(
    RegisterCommerceEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
