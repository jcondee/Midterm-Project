import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logout')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to LoginScreen
            Navigator.pushNamedAndRemoveUntil(
              context, 
              '/', 
              (route) => false
            );
          },
          child: const Text('Log Out and Return to Login'),
        ),
      ),
    );
  }
}
