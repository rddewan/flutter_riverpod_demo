
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberRepositoryProvider = Provider<NumberRepository>((ref) {
  return NumberRepository();
});
class NumberRepository{

}