import 'package:chal_threads_home/features/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ThreadsApp());
}

class ThreadsApp extends StatelessWidget {
  const ThreadsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Threads Clone",
      home: HomeScreen(),
    );
  }
}
