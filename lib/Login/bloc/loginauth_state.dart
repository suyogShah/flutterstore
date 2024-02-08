part of 'loginauth_bloc.dart';

@immutable

sealed class AuthState {}


abstract class AuthAction extends AuthState {}


class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthAction {}

class AuthLoadingState extends AuthState{}

class AuthUnauthenticated extends AuthState {
  final String error;

  AuthUnauthenticated({required this.error});

}
