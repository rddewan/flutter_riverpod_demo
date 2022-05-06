
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/repository/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();

});


class UserRepositoryImpl extends UserRepository {
  @override
  String getUserAddress() {
    return 'My address is empty';
  }

  @override
  String getUserName() {
    return 'Richard';
  }

}