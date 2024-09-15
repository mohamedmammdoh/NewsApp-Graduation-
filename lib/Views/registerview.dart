import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/CustomWidgets/custombutton.dart';
import 'package:news/CustomWidgets/customtextformfield.dart';
import 'package:news/Views/loginview.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static String routename = 'registerview';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final UserName = TextEditingController();
    bool isObsurePassword = true;

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                Text(
                  'Register Now !',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 100),
                CustomTextFormField(
                  hinttext: 'please enter your name..',
                  labeltext: 'UserName',
                  prefixIcon: Icon(Icons.person),
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'change your username';
                    }
                  },
                  controller: UserName,
                  isobsure: false,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  hinttext: 'please enter your Email Address..',
                  labeltext: 'Email Address',
                  prefixIcon: Icon(Icons.email),
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'change your email address';
                    }
                  },
                  controller: emailController,
                  isobsure: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Change your password';
                    }
                    return null;
                  },
                  isobsure: isObsurePassword,
                  hinttext: 'please enter your password..',
                  labeltext: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                SizedBox(height: 20),
                CustomButton(buttonName: 'REGISTER', onPressed: () {}),
                SizedBox(height: 10),
                Container(
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Already you have account ?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomButton(
                    buttonName: 'LOGIN',
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}