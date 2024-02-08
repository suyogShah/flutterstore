part of 'loginauth_bloc.dart';

@immutable
sealed class LoginauthEvent {}

 class HomeInitialEvent extends LoginauthEvent{}

class LoginEvent extends LoginauthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
}

