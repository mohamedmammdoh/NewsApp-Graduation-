import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/CustomWidgets/custombutton.dart';
import 'package:news/CustomWidgets/customtextformfield.dart';
import 'package:news/Views/homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/Views/registerview.dart';
import 'package:news/cubit/logincubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  static String routename = 'loginview';

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: loginCubit.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 130),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(height: 100),
                  CustomTextFormField(
                    suffixIcon: null,
                    isobsure: false,
                    keyboardType: TextInputType.emailAddress,
                    hinttext: 'please enter your email..',
                    labeltext: 'EmailAddress',
                    prefixIcon: Icon(Icons.email),
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Change your email';
                      }
                      return null;
                    },
                    controller: loginCubit.emailController,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    isobsure: loginCubit.isObsurePassword,
                    hinttext: 'please enter your password..',
                    labeltext: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          loginCubit.isObsurePassword =
                              !loginCubit.isObsurePassword;
                        },
                        icon: Icon(
                          loginCubit.isObsurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                    prefixIcon: Icon(Icons.lock),
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Change your password';
                      }
                      return null;
                    },
                    controller: loginCubit.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: loginCubit.emailController.text);
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
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forgetten Passsowrd?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    buttonName: 'LOGIN',
                    onPressed: () async {
                      String email = loginCubit.emailController.text;
                      String password = loginCubit.passwordController.text;
                      bool loggedIn = await loginCubit.signIn(email, password);

                      if (loginCubit.formkey.currentState!.validate()) {
                        if (loggedIn) {
                          print('Successfully');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully'),
                            ),
                          );

                          Navigator.pushReplacementNamed(
                              context, NewsView.routename);
                        } else {
                          // Handle unsuccessful login
                          print('Invalid');

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Opps error with email or password'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Don\'t have Account ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    buttonName: 'REGISTER',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RegisterView.routename);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Future<bool> signIn(String emailAddress, String password) async {
//   try {
//     await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: emailAddress, password: password);
//     return true; // Successful login
//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//       return false; // Unsuccessful login
//     }
//     // Handle other exceptions if needed
//     return false;
//   }
// }
