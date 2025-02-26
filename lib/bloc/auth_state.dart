part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginInitial extends AuthState {}
class LoginLoad extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginFailed extends AuthState {}

class RegisterInitial extends AuthState {}

class RegisterLoad extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailed extends AuthState {
  String errMessage;
  RegisterFailed( {required this.errMessage});
}
