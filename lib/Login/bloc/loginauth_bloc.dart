import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:suyogstore/Login/repo/loginrepo.dart';

part 'loginauth_event.dart';
part 'loginauth_state.dart';

class LoginauthBloc extends Bloc<LoginauthEvent, AuthState> {
  LoginauthBloc() : super(AuthInitial()) {
    on<LoginEvent>(loginauthEvent);
  }

  Future<FutureOr<void>> loginauthEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try{

    final  success = await LoginRepo.login(event.username,event.password);
    if(success!=null)
    {
  
      emit(AuthAuthenticated());
    }else
    {
      emit(AuthUnauthenticated(error: 'Invalid Credentials'));
    }

    } 
    catch(e){
      emit(AuthUnauthenticated(error: e.toString()));
    }
    }
  }

    

  
