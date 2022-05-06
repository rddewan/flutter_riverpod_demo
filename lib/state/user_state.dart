import 'package:flutter/material.dart';

@immutable
class UserState {
  final String name;
  final String address;

  UserState({
    required this.name,
    required this.address,
  });
  

  

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserState &&
      other.name == name &&
      other.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode;

  @override
  String toString() => 'UserState(name: $name, address: $address)';

  UserState copyWith({
    String? name,
    String? address,
  }) {
    return UserState(
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }
}
