import 'package:chal_threads_home/features/profile/models/dark_mode_model.dart';
import 'package:chal_threads_home/features/profile/repos/dark_mode_repo.dart';
import 'package:flutter/foundation.dart';

class DarkModeViewModel extends ChangeNotifier {
  final DarkModeRepository _darkModeRepository;

  late final DarkModeModel _darkModeModel =
      DarkModeModel(isDarkMode: _darkModeRepository.isDarkMode());

  DarkModeViewModel(this._darkModeRepository);

  bool get isDarkMode => _darkModeModel.isDarkMode;

  void setDarkMode(bool value) {
    _darkModeModel.isDarkMode = value;
    _darkModeRepository.setDarkMode(value);
    notifyListeners();
  }
}
