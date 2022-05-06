
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/repository/user_repository.dart';
import 'package:flutter_riverpod_demo/repository/user_repository_impl.dart';
import 'package:flutter_riverpod_demo/service/user_service.dart';

final userServiceProvider = Provider<UserService>((ref) {
  final repository = ref.watch(userRepositoryProvider);

  return UserServiceImpl(repository);

});


class UserServiceImpl extends UserService{
  final UserRepository repository;

  UserServiceImpl(this.repository);

  @override
  String getUserAddress() {
    return repository.getUserAddress();
    
  }

  @override
  String getUserName() {
    return repository.getUserName();
    
  }

  
  
}