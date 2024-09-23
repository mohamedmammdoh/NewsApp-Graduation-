import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Views/homeview.dart';
import 'package:news/Views/loginview.dart';
import 'package:news/cubit/registercubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final UserName = TextEditingController();
  bool isObsurePassword = true;
  GlobalKey<FormState> formkey = GlobalKey();

  Future<void> Register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(RegisterLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Navigator.pushReplacementNamed(context, LoginView.routename);
      if (credential.user!.emailVerified) {
        Navigator.pushReplacementNamed(context, NewsView.routename);
        emit(RegisterSuccess());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Go to verifiy account by email!!'),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
        emit(RegisterFailer());
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
        emit(RegisterFailer());
      }
    } catch (e) {
      print(e);
      emit(RegisterFailer());
    }
  }
}
