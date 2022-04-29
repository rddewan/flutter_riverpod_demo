
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/repository/number_repository.dart';
import 'package:flutter_riverpod_demo/state/number_state.dart';


final numberControllerProvider = StateNotifierProvider<NumberController,NumberState>((ref) {
  final _repository = ref.watch(numberRepositoryProvider);

  return NumberController(_repository,NumberState(generatedNumber: 0));
});

class NumberController extends StateNotifier<NumberState> {
  final NumberRepository _repository;
  NumberController(this._repository, NumberState state) : super(state);

  void increment(int value){
    
    final s =  NumberState(generatedNumber: 0);
    state = s;
   
  }

  void decrement(int value){
    state = state.copyWith(generatedNumber: value);    
  }

}