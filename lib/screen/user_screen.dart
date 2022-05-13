
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/controller/account_controller.dart';
import 'package:flutter_riverpod_demo/controller/number_controller.dart';
import 'package:flutter_riverpod_demo/controller/user_controller.dart';
import 'package:flutter_riverpod_demo/screen/account_screen.dart';
import 'package:flutter_riverpod_demo/screen/number_screen.dart';
import 'package:flutter_riverpod_demo/state/user_state.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  int _generatedNumber = 0;

  @override
  void initState() {    
    super.initState();
    ref.listen<UserState>(userControllerProvider, (previous, next) { 
      if(next.name.isNotEmpty) {
        
      }

    }) ;
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) { 
      ref.read(userControllerProvider.notifier).getUserName();
      ref.read(userControllerProvider.notifier).getAddress();
      ref.read(userControllerProvider.notifier).getUserPhone();

    });
    
  }

  @override
  Widget build(BuildContext context) {  
    debugPrint('BuildContext'); 
    ref.listen<UserState>(userControllerProvider, (previous, next) { 
      if(next.name.isNotEmpty) {
        
      }

    }) ;
    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Number'),
      ),
      body: Center(       
        child: Column(         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Consumer(
              builder: (context,ref,child) {
                debugPrint('Consumer');
                final address = ref.watch(userControllerProvider.select((value) => value.address)); 

                return Text('Address: $address');
              }
            ),
            Consumer(
              builder: (context,ref,child) {
                debugPrint('Consumer');
                final phone = ref.watch(userControllerProvider.select((value) => value.phone)); 
                return phone.when(
                  data: (data) {
                    return Text('Address: $data');
                  },
                  error: (e,s) {
                    return Text('Error: ${e.toString()}');
                  },
                  loading: () {
                    return const CircularProgressIndicator();
                  }
                );                
              }
            ),

            
            
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [           
          FloatingActionButton(
            onPressed:  () {
              ref.refresh(userControllerProvider); 
                          
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const AccountScreen())));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), 
        ],
      )
    );
  }
}