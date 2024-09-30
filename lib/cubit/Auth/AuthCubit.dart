import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Views/homeview.dart';
import 'package:news/Views/loginview.dart';
import 'package:news/cubit/Auth/Authstate.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObsurePassword = true;

  GlobalKey<FormState> formkey = GlobalKey();

  final emailControllerRegister = TextEditingController();
  final passwordControllerRegister = TextEditingController();
  final UserName = TextEditingController();
  bool isObsurePasswordRegister = true;
  GlobalKey<FormState> formkeyRegister = GlobalKey();

  Future<bool> signIn(String emailAddress, String password) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(LoginSuccessState());
      return true; // Successful login
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        emit(LoginFailerState());
        return false; // Unsuccessful login
      }
      // Handle other exceptions if needed
      emit(LoginFailerState());

      return false;
    }
  }

  Future<void> Register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(RegisterLaodingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Navigator.pushReplacementNamed(context, LoginView.routename);
      if (credential.user!.emailVerified) {
        Navigator.pushReplacementNamed(context, HomeView.routename);
        emit(RegisterSuccessState());
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
        emit(RegisterFailerState());
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
        emit(RegisterFailerState());
      }
    } catch (e) {
      print(e);
      emit(RegisterFailerState());
    }
  }

  Future<void> LogOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, LoginView.routename);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('LogOut Successfully'),
      ),
    );
    emit(LogoutSuccessState());
  }

  Future<void> ForgettenPassword({
    required BuildContext context,
    required TextEditingController emailcontroller,
  }) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text);
      // Navigator.pop(context); // Close the dialog
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Password reset email sent!'),
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('No user found for that email.'),
        ));
      }
    }
  }

  void ObsureTextLogin() {
    isObsurePassword = !isObsurePassword;
  }

  void ObsureTextRegister() {
    isObsurePasswordRegister = !isObsurePasswordRegister;
  }
}
