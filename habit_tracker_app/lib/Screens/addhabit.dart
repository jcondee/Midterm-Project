import 'package:flutter/material.dart';

class AddHabitScreen extends StatefulWidget {
  const AddHabitScreen({super.key});

  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final TextEditingController _habitController = TextEditingController();

  void _addHabit() {
    if (_habitController.text.isNotEmpty) {
      Navigator.pop(context, _habitController.text);  // Return the new habit
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Habit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _habitController,
              decoration: const InputDecoration(
                labelText: 'Enter Habit',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addHabit,
              child: const Text('Add Habit'),
            ),
          ],
        ),
      ),
    );
  }
}
