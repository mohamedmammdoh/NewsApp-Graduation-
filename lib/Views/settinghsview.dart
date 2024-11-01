import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/CustomWidgets/custommatrialbutton.dart';
import 'package:news/core/ThemeApp.dart';
import 'package:news/cubit/Auth/AuthCubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static String routename = 'settinghsview';
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, right: 10, left: 10),
        child: Column(
          children: [
            Text(
              'Welcome You can update your theme and make some operation......................',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 100),
            CustomMatrialButton(
              name: 'Switched The Theme by Click',
              onPressed: () {
                ThemeService().changeTheme();
              },
            ),
            SizedBox(height: 100),
            // CustomMatrialButton(
            //   name: 'LogOut',
            //   onPressed: () async {
            //     await authCubit.LogOut(context: context);
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
