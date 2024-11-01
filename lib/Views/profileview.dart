import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'loginview.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    final user = this.user;
    if (user != null) {
      _usernameController.text = user.displayName ?? '';
      _phoneController.text = user.phoneNumber ?? '';
    }
  }

  Future<void> _updateProfile() async {
    try {
      await user?.updateProfile(displayName: _usernameController.text);

      await user?.reload();
      setState(() {
        _isEditing = false;
      });
    } catch (e) {
      print('Error updating profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // User Name Field
            TextField(
              controller: _usernameController,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                suffixIcon: _isEditing
                    ? IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: _updateProfile,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 20),

            // Phone Number Field
            TextField(
              controller: _phoneController,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Edit Button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                });
              },
              child: Text(_isEditing ? 'Cancel' : 'Edit Profile'),
            ),

            const Spacer(),

            // Logout Button
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed(
                    LoginView.routename); // Change to your login route
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Red color for the logout button
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: Size(double.infinity, 50), // Full width
              ),
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
