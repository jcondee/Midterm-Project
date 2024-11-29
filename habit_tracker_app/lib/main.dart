import 'package:flutter/material.dart';
import 'package:habit_tracker_app/Screens/homescreen.dart';
import 'package:habit_tracker_app/Screens/loginscreen.dart';
import 'package:habit_tracker_app/Screens/logoutscreen.dart';
import 'package:habit_tracker_app/Screens/profilescreen.dart';
import 'package:habit_tracker_app/Screens/notificationscreen.dart'; // Import NotificationScreen

void main() {
  runApp(const HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  const HabitTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/logout': (context) => const LogoutScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/notifications': (context) => const NotificationScreen(), // Add route for notifications
      },
    );
  }
}
