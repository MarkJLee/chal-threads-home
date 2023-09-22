import 'dart:async';

import 'package:chal_threads_home/features/profile/models/user_model.dart';
import 'package:chal_threads_home/features/search/repos/search_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchViewModel extends AsyncNotifier<List<UserModel>> {
  late final SearchRepository _searchRepo;

  SearchViewModel(this._searchRepo);

  @override
  FutureOr<List<UserModel>> build() async {
    _searchRepo = ref.read(searchRepositoryProvider);
    return [];
  }

  Future<List<UserModel>> searchUsers(String query) async {
    return await _searchRepo.searchUsersInFirestore(query);
  }
}

final searchViewModelProvider = Provider<SearchViewModel>(
  (ref) => SearchViewModel(ref.read(searchRepositoryProvider)),
);
