import 'package:flutter/material.dart';

import 'contactwidget.dart';

class CustomListVIewBuilderButtom extends StatelessWidget {
  const CustomListVIewBuilderButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContactWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                Text(
                  'Mohamed Mammdoh',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 200,
                  child: Text(
                    'Hi brother my name is ahmadHi brother my name is ahmadHi brother my name is ahmadHi brother my name is ahmadHi brother my name is ahmad',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 5,
            ),
            Text('2:00 pm'),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemCount: 20,
    );
  }
}