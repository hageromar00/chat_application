part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {
}
class LoginLoad extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailed extends LoginState {}


