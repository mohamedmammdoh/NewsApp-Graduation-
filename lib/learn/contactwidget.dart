import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://scontent.fcai19-2.fna.fbcdn.net/v/t39.30808-6/274187943_505701290900394_5425982186547531645_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeEVmR4g2bt67No34zx912unwyQwrui90svDJDCu6L3Sy0b1ibT7HR3B2kOQeftp6LumJfNSk6H9Dnsc7yTgXVFC&_nc_ohc=E9cQeN1UbI8Q7kNvgH5h0rW&_nc_ht=scontent.fcai19-2.fna&_nc_gid=AOIeAoXyqQSGk1cMuPbLABJ&oh=00_AYD-Y6jxRtUNyBArHMaerOFlrZrBrEaLXGGpQUUQMep97Q&oe=66F49271'),
        ),
        Positioned(
          left: 50,
          child: Padding(
            padding: EdgeInsets.only(top: 60.0, left: 5),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              radius: 9,
            ),
          ),
        ),
      ],
    );
  }
}