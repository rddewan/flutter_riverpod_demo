

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/service/user_service.dart';
import 'package:flutter_riverpod_demo/service/user_service_impl.dart';
import 'package:flutter_riverpod_demo/state/user_state.dart';

final accountControllerProvider = StateNotifierProvider.autoDispose<AccountController,UserState>((ref) {
  final service = ref.watch(userServiceProvider);

  return AccountController(UserState(name: '', address: '', phone: const AsyncValue.loading()),  service);

});


class AccountController extends StateNotifier<UserState> {
  final UserService service;

  AccountController(UserState state, this.service) : super(state);

  void getUserName(){
    final user = service.getUserName();
    state = state.copyWith(name: user);
  }

  void getAddress(){
    final address = service.getUserAddress();
    state = state.copyWith(address: address);
  }

  void getUserPhone() {
    
    state = state.copyWith(phone: const AsyncValue.loading());   
    final value =  service.getPhone();
    
    state = state.copyWith(phone: AsyncValue.data(value));

  }

  @override
  void dispose() {
    debugPrint('controller dispose');
    super.dispose();
  }

}