// modal_helpers.dart
import 'package:chal_threads_home/features/profile/views/edit_profile_screen.dart';
import 'package:chal_threads_home/features/write/views/write_screen.dart';
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

void showEditProfileModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return const Center(
        child: EditProfileScreen(),
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
