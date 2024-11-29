import 'package:flutter/material.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  AddHabitScreenState createState() => AddHabitScreenState();
}

class AddHabitScreenState extends State<AddHabitScreen> {
  final TextEditingController _habitController = TextEditingController();

  void _addHabit() {
    if (_habitController.text.isNotEmpty) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Habit Added Successfully'),
          duration: Duration(seconds: 2),
        ),
      );
      // Return the new habit to the HomeScreen
      Navigator.pop(context, _habitController.text);
    } else {
      // Show error message if habit is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a habit'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Habit'),
        backgroundColor: const Color.fromARGB(255, 220, 121, 240),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Multi-line Text Field (Text Box)
            TextField(
              controller: _habitController,
              maxLines: null,  // Allow multiple lines
              decoration: const InputDecoration(
                labelText: 'What is your new habit?',
                border: OutlineInputBorder(),  // Make it a text box with border
                contentPadding: EdgeInsets.all(10),
              ),
            ),
            const SizedBox(height: 16),
            // Custom Add Habit Button
            ElevatedButton(
              onPressed: _addHabit,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple, // Text color
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('Add Habit'),
            ),
          ],
        ),
      ),
    );
  }
}
