
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/controller/account_controller.dart';
import 'package:flutter_riverpod_demo/controller/user_controller.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
@override
  void initState() {    
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      ref.read(accountControllerProvider.notifier).getAddress();
     });
  }

  @override
  Widget build(BuildContext context) {
    final address = ref.watch(accountControllerProvider.select((value) => value.address));
    final name = ref.watch(userControllerProvider.select((value) => value.name));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        children: [
          Text('Address: $address'),
          Text('Address: $name')
        ],
      ),
    );
  }
}