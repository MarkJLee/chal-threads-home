import 'package:chal_threads_home/features/profile/view_models/dark_mode_mv.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

bool isDarkMode(BuildContext context) {
  // MediaQuery.of(context).platformBrightness == Brightness.dark;
  final darkModeVM = Provider.of<DarkModeViewModel>(context);
  return darkModeVM.isDarkMode;
}
