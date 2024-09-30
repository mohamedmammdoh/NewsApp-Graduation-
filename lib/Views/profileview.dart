import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/CustomWidgets/custommatrialbutton.dart';
import 'package:news/cubit/Auth/AuthCubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String routename = 'profileview';

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);

    return Column(
      children: [
        SizedBox(height: 30),
        Center(
          child: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 100,
            ),
            radius: 100,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Mohamed Mammdoh',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          'mohamedmammdohharby@gmail.com',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          height: 50,
        ),
        CustomMatrialButton(
          name: 'Change your Password Click her',
          onPressed: () {
            authCubit.ForgettenPassword(
                context: context, emailcontroller: authCubit.emailController);
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomMatrialButton(
          name: 'LogOut',
          onPressed: () async {
            await authCubit.LogOut(context: context);
          },
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
