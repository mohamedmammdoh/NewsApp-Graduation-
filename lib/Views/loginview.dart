import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/CustomWidgets/custombutton.dart';
import 'package:news/CustomWidgets/customtextformfield.dart';
import 'package:news/Views/MainView.dart';
import 'package:news/Views/registerview.dart';
import 'package:news/cubit/Auth/AuthCubit.dart';


class LoginView extends StatefulWidget {
  static String routename = 'loginview';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: authCubit.formkey,
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
                    controller: authCubit.emailController,
                  ),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    isobsure: authCubit.isObsurePassword,
                    hinttext: 'please enter your password..',
                    labeltext: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () {
                          authCubit.ObsureTextLogin();
                          setState(() {});
                        },
                        icon: Icon(
                          authCubit.isObsurePassword
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
                    controller: authCubit.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  TextButton(
                    onPressed: () async {
                      await authCubit.ForgettenPassword(
                          context: context,
                          emailcontroller: authCubit.emailController);
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forgetten Passsowrd?',
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
                    onPressed: () async {
                      String email = authCubit.emailController.text;
                      String password = authCubit.passwordController.text;
                      bool loggedIn = await authCubit.signIn(email, password);

                      if (authCubit.formkey.currentState!.validate()) {
                        if (loggedIn) {
                          print('Successfully');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully'),
                            ),
                          );

                          Navigator.pushReplacementNamed(
                              context, MainView.routename,
                              arguments: email
                          );

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
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assests/images/facebook-logo.png',
                            width: 100,
                            height: 30,
                          ),
                          Text(
                            'SignIn With Facebook',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
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
