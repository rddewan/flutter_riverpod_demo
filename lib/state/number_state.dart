import 'package:flutter/material.dart';

@immutable
class NumberState {
  int generatedNumber = 0;

  NumberState({
    required this.generatedNumber,
  });
  

  @override
  String toString() => 'NumberState(generatedNumber: $generatedNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NumberState &&
      other.generatedNumber == generatedNumber;
  }

  @override
  int get hashCode => generatedNumber.hashCode;

  NumberState copyWith({
    int? generatedNumber,
  }) {
    return NumberState(
      generatedNumber: generatedNumber ?? this.generatedNumber,
    );
  }
}
