import 'package:chal_threads_home/features/profile/models/dark_mode_model.dart';
import 'package:chal_threads_home/features/profile/repos/dark_mode_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeViewModel extends Notifier<DarkModeModel> {
  final DarkModeRepository _darkModeRepository;

  DarkModeViewModel(this._darkModeRepository);

  void setDarkMode(bool value) {
    _darkModeRepository.setDarkMode(value);
    state = DarkModeModel(isDarkMode: value);
  }

  @override
  DarkModeModel build() {
    return DarkModeModel(isDarkMode: _darkModeRepository.isDarkMode());
  }
}

final darkModeProvider = NotifierProvider<DarkModeViewModel, DarkModeModel>(
    () => throw UnimplementedError());
