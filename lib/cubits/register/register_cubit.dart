import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  Future<void> RegisterUser(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFail('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFail('The account already exists for that email.'));
      }
    } catch (e) {
      emit(RegisterFail('An error occurred'));
    }
  }
}
