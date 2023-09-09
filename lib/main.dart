import 'package:chal_threads_home/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ThreadsApp());
}

class ThreadsApp extends StatelessWidget {
  const ThreadsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: "Threads Clone",
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
          elevation: 0,
        ),
      ),
    );
  }
}
