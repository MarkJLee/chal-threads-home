// modal_helpers.dart
import 'package:chal_threads_home/features/write/write_screen.dart';
import 'package:chal_threads_home/initial_screen.dart';
import 'package:flutter/material.dart';

void showWriteModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: WriteScreen(),
      );
    },
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    useSafeArea: true,
    enableDrag: true,
  );
}

// navigation_helpers.dart
void navigateBasedOnIndex(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InitialScreen(
                    initialIndex: 0,
                  )));
      break;
    case 1:
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InitialScreen(initialIndex: 1)));
      break;
    case 2:
      showWriteModal(context);
      break;
    case 3:
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InitialScreen(
                    initialIndex: 3,
                  )));
      break;
    case 4:
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const InitialScreen(initialIndex: 4)));
      break;
    default:
      break;
  }
}
