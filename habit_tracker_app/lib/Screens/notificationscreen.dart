import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  bool _isNotificationRead = false; // To track the notification status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Notification 1
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: _isNotificationRead ? Colors.grey : Colors.red,
              ),
              title: Text(
                'Habit Reminder: Meditation for today',
                style: TextStyle(
                  color: _isNotificationRead ? Colors.grey : Colors.black,
                  fontWeight: _isNotificationRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              trailing: _isNotificationRead
                  ? null
                  : CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                    ),
              onTap: () {
                setState(() {
                  _isNotificationRead = true; // Mark as read
                });
              },
            ),
            const Divider(),
            // Notification 2
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.red,
              ),
              title: const Text('Reminder: Read a novel book'),
              trailing: _isNotificationRead
                  ? null
                  : CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                    ),
              onTap: () {
                setState(() {
                  _isNotificationRead = true; // Mark as read
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
