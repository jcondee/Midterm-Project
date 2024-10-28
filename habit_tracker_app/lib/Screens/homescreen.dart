import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 4) {
      Navigator.pushNamed(context, '/profile'); 
    }
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
            
            Container(
              width: 500, 
              height: 200, 
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 193, 74, 230),
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
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recently Added Habits',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  HabitItem(title: 'Meditation'),
                  HabitItem(title: 'Read a novel book'),
                  HabitItem(title: 'Learning new recipe'),
                ],
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
        onTap: _onItemTapped,
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
            label: '', 
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


class HabitItem extends StatelessWidget {
  final String title;

  const HabitItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4), 
      padding: const EdgeInsets.all(16), 
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
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
      child: Text(
        title,
        style: const TextStyle(fontSize: 16), 
      ),
    );
  }
}
