import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/CustomWidgets/custombutton.dart';
import 'package:news/CustomWidgets/customtextformfield.dart';
import 'package:news/Views/loginview.dart';
import 'package:news/cubit/Auth/AuthCubit.dart';

class RegisterView extends StatelessWidget {
  static String routename = 'registerview';

  @override
  Widget build(BuildContext context) {
    final registerCubit = BlocProvider.of<AuthCubit>(context);

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: registerCubit.formkeyRegister,
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
                    suffixIcon: null,
                    hinttext: 'please enter your name..',
                    labeltext: 'UserName',
                    prefixIcon: Icon(Icons.person),
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'change your username';
                      }
                      return null;
                    },
                    controller: registerCubit.UserName,
                    isobsure: false,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    suffixIcon: null,
                    hinttext: 'please enter your Email Address..',
                    labeltext: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'change your email address';
                      }
                      return null;
                    },
                    controller: registerCubit.emailControllerRegister,
                    isobsure: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    suffixIcon: null,
                    keyboardType: TextInputType.visiblePassword,
                    controller: registerCubit.passwordControllerRegister,
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Change your password';
                      }
                      return null;
                    },
                    isobsure: registerCubit.isObsurePasswordRegister,
                    hinttext: 'please enter your password..',
                    labeltext: 'Password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    buttonName: 'REGISTER',
                    onPressed: () async {
                      if (registerCubit.formkeyRegister.currentState!
                          .validate()) {
                        registerCubit.Register(
                          email: registerCubit.emailControllerRegister.text,
                          password:
                              registerCubit.passwordControllerRegister.text,
                          context: context,
                        );
                      }
                    },
                  ),
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
                              builder: (context) => LoginView(),
                            ));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
