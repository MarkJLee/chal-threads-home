import 'package:chal_threads_home/features/profile/repos/dark_mode_repo.dart';
import 'package:chal_threads_home/features/profile/view_models/dark_mode_mv.dart';
import 'package:chal_threads_home/firebase_options.dart';
import 'package:chal_threads_home/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name:
          "ChalThreads", // https://stackoverflow.com/questions/70812697/a-firebase-app-named-default-already-exists/71644195#71644195?newreg=1ce9af4c61da4cf992581f7e8b35dcfc
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  final preferences = await SharedPreferences.getInstance();
  final repository = DarkModeRepository(preferences);

  runApp(
    ProviderScope(
      overrides: [
        darkModeProvider.overrideWith(() => DarkModeViewModel(repository))
      ],
      child: const ThreadsApp(),
    ),
  );
}

class ThreadsApp extends ConsumerWidget {
  const ThreadsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final darkModeVM = Provider.of<DarkModeViewModel>(context, listen: true);
    final isDarkMode = ref.watch(darkModeProvider).isDarkMode;
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: "Threads Clone",
      // themeMode: ThemeMode.system,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        listTileTheme: const ListTileThemeData(iconColor: Colors.black),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
          opacity: 1,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
          opacity: 1,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
          elevation: 0,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
