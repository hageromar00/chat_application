import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
     if (event is LoginEvent) {
      emit(LoginLoad());
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: event.email, password: event.password);
        emit(LoginSuccess());
      } on Exception catch (e) {
        emit(LoginFailed());
      }
    }
  }
    @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}
