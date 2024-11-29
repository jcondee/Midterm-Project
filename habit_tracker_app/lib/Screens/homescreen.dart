import 'package:flutter/material.dart';
import 'package:habit_tracker_app/Screens/addhabit.dart';  // Import the AddHabitScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List to store recently added habits
  List<Map<String, dynamic>> recentHabits = [
    {'title': 'Meditation', 'isDone': false},
    {'title': 'Read a novel book', 'isDone': false},
    {'title': 'Learning new recipe', 'isDone': false},
  ];

  // Function to handle bottom navigation item tap
  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // Navigate to notifications
      Navigator.pushNamed(context, '/notifications');
    } else if (index == 4) {
      // Navigate to Profile
      Navigator.pushNamed(context, '/profile');
    } else if (index == 2) {
      // Open the Add Habit screen
      final newHabit = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddHabitScreen(),
        ),
      );

      // If a habit is added, update the list
      if (newHabit != null && newHabit.isNotEmpty) {
        setState(() {
          recentHabits.add({'title': newHabit, 'isDone': false}); // Add the new habit to the list
        });
      }
    }
  }

  // Function to mark habit as done
  void _markAsDone(int index) {
    setState(() {
      recentHabits[index]['isDone'] = true;
    });
  }

  // Function to remove habit
  void _removeHabit(int index) {
    setState(() {
      recentHabits.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 121, 240),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.dashboard, color: Colors.black),
            SizedBox(width: 8),
            Text('Dashboard', style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           // Placeholder container for the habit card
Container(
  width: 500,
  height: 200,
  decoration: BoxDecoration(
    color: const Color.fromARGB(255, 210, 112, 240),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ],
  ),
  child: const Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back, Janilla!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 7),
        Text(
          'Today\'s quote:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(207, 255, 255, 255),
          ),
        ),
        SizedBox(height: 4),
        Text(
          '"Discipline creates habits, and habits create success."',
          style: TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Colors.white,
          ),
        ),
      ],
    ),
  ),
),
const SizedBox(height: 16),
const Text(

              'Recently Added Habits',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: recentHabits.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: recentHabits[index]['isDone']
                          ? Colors.grey[300]
                          : Colors.white, // Grayed out if done
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Habit Title
                        Text(
                          recentHabits[index]['title'],
                          style: TextStyle(
                            fontSize: 16,
                            color: recentHabits[index]['isDone']
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: recentHabits[index]['isDone']
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                        ),
                        // Action Icons (Check and Trash)
                        Row(
                          children: [
                            // Check Icon (Mark as done)
                            IconButton(
                              icon: Icon(
                                Icons.check_circle,
                                color: recentHabits[index]['isDone']
                                    ? const Color.fromARGB(255, 230, 109, 235)
                                    : const Color.fromARGB(255, 214, 58, 228),
                              ),
                              onPressed: () => _markAsDone(index),
                            ),
                            // Trash Icon (Remove habit)
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 185, 14, 171),
                              ),
                              onPressed: () => _removeHabit(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,  // Handle all the taps here
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 220, 121, 240),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 32, color: Colors.white),
            ),
            label: 'Add',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
