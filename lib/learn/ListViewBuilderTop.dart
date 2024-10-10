import 'package:flutter/material.dart';

import 'contactwidget.dart';

class ListViewBuilderTop extends StatelessWidget {
  const ListViewBuilderTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const ContactWidget(),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 10,
      ),
    );
  }
}