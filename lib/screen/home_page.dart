import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        children:  [
          const Center(
            child: Text(
              'Home Screen'
              ),
          ),
           MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: const Text(
              'Log Out',
              style: TextStyle(
                color: Colors.deepPurple,
              ),
              ),
            )
        ],
      ),
    );
  }
}