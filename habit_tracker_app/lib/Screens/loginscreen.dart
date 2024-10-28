import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 220, 121, 240), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            const SizedBox(height: 40),

            // Centered title
            const Text(
              'HabitHaven',
              style: TextStyle(
                color: Color.fromARGB(255, 117, 13, 112),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32), 
            
const TextField(
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white, 
    hintText: 'Email', 
    hintStyle: TextStyle(color: Colors.black), 
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)), 
      borderSide: BorderSide.none, 
    ),
  ),
),
const SizedBox(height: 16),

            
const TextField(
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white, 
    hintText: 'Password', 
    hintStyle: TextStyle(color: Colors.black), 
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)), 
      borderSide: BorderSide.none, 
    ),
  ),
  obscureText: true,
),
const SizedBox(height: 16),

            
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: const Text('Login'),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}