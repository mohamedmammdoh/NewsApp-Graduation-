import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/custombutton.dart';
import 'package:news/CustomWidgets/customtextformfield.dart';
import 'package:news/Views/homeview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/Views/registerview.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String routename = 'loginview';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObsurePassword = true;
  GlobalKey<FormState> formkey = GlobalKey();

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
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
                    controller: emailController,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    isobsure: isObsurePassword,
                    hinttext: 'please enter your password..',
                    labeltext: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              isObsurePassword = !isObsurePassword;
                            },
                          );
                        },
                        icon: Icon(
                          isObsurePassword
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
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  TextButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text);
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
                      String email = emailController.text;
                      String password = passwordController.text;
                      bool loggedIn = await signIn(email, password);

                      if (formkey.currentState!.validate()) {
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

Future<bool> signIn(String emailAddress, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    return true; // Successful login
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      return false; // Unsuccessful login
    }
    // Handle other exceptions if needed
    return false;
  }
}
