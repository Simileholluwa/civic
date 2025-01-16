import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.username,
  });

  final String username;

  static String route([String? username]) => '/${username ?? ':username'}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Profile screen of $username',
      )),
    );
  }
}
