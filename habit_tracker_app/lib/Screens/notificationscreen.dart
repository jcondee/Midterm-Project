import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  // List of notifications with read/unread state
  final List<Map<String, dynamic>> notifications = [
    {
      'message': "Habit Reminder: Meditation for today",
      'isRead': false,
    },
    {
      'message': "Reminder: Read a novel book",
      'isRead': false,
    },
    {
      'message': "You’ve completed your 7-day streak in Meditation!",
      'isRead': false,
    },
    {
      'message': "You missed your scheduled habit today: Drink Water 💧",
      'isRead': false,
    },
    {
      'message': "Success: You've achieved 85% of your weekly habits!",
      'isRead': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: const Color.fromARGB(255, 220, 121, 240),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            final bool isRead = notification['isRead'];

            return ListTile(
              leading: Icon(
                Icons.notifications,
                color: isRead ? Colors.grey : const Color.fromARGB(255, 233, 104, 216), // Red for unread, grey for read
              ),
              title: Text(
                notification['message'],
                style: TextStyle(
                  color: isRead ? Colors.grey : Colors.black,
                  fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              trailing: isRead
                  ? null
                  : const CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.red,
                    ),
              onTap: () {
                setState(() {
                  notifications[index]['isRead'] = true; // Mark as read when tapped
                });
              },
            );
          },
        ),
      ),
    );
  }
}
