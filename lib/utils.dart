// import 'package:chal_threads_home/features/profile/view_models/dark_mode_mv.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// bool isDarkMode(BuildContext context) {
//   // context.read를 사용하여 DarkModeViewModel의 현재 상태를 가져옵니다.
//   final darkModeVM = context.read<DarkModeViewModel>();
//   return darkModeVM.state.isDarkMode;
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void showFirebaseErrorSnack(
  BuildContext context,
  Object? error,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      content:
          Text((error as FirebaseException).message ?? "something wen't wrong"),
    ),
  );
}
