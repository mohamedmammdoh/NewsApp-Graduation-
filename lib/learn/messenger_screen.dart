
import 'package:flutter/material.dart';

import 'CustomListVIewBuilderButtom.dart';
import 'ListViewBuilderTop.dart';

class MassengerView extends StatelessWidget {
  const MassengerView({super.key});
  static String routename = 'massengerview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                'https://scontent.fcai19-2.fna.fbcdn.net/v/t39.30808-6/274187943_505701290900394_5425982186547531645_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeEVmR4g2bt67No34zx912unwyQwrui90svDJDCu6L3Sy0b1ibT7HR3B2kOQeftp6LumJfNSk6H9Dnsc7yTgXVFC&_nc_ohc=E9cQeN1UbI8Q7kNvgH5h0rW&_nc_ht=scontent.fcai19-2.fna&_nc_gid=AOIeAoXyqQSGk1cMuPbLABJ&oh=00_AYD-Y6jxRtUNyBArHMaerOFlrZrBrEaLXGGpQUUQMep97Q&oe=66F49271'),
          ),
        ),
        title: const Text(
          'Chats',
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            SearchBar(
              leading: Icon(Icons.search),
              hintText: 'Search',
            ),
            SizedBox(height: 10),
            ListViewBuilderTop(),
            SizedBox(height: 10),
            CustomListVIewBuilderButtom(),
          ],
        ),
      ),
    );
  }
}