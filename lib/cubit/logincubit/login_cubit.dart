import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/cubit/logincubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObsurePassword = true;
  GlobalKey<FormState> formkey = GlobalKey();

  Future<bool> signIn(String emailAddress, String password) async {
    emit(LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSucess());
      return true; // Successful login
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        emit(LoginFaliar());
        return false; // Unsuccessful login
      }
      // Handle other exceptions if needed
      emit(LoginFaliar());

      return false;
    }
  }
}
