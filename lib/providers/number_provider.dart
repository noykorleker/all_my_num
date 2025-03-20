import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateNotifierProvider<NumberNotifier, NumberState>((ref) {
  return NumberNotifier();
});

class NumberState {
  final int? selectedNumber;
  const NumberState({this.selectedNumber});
}

class NumberNotifier extends StateNotifier<NumberState> {
  NumberNotifier() : super(const NumberState());

  final Map<int, bool> primeCache = {};

  bool isPrime(int n) {
    if (primeCache.containsKey(n)) {
      return primeCache[n]!;
    }
    if (n < 2) return primeCache[n] = false;
    for (int i = 2; i <= sqrt(n).toInt(); i++) {
      if (n % i == 0) return primeCache[n] = false;
    }
    return primeCache[n] = true;
  }

  bool isHighlighted(int number) {
    if (state.selectedNumber == null) return false;
    return number != state.selectedNumber && gcd(number, state.selectedNumber!) > 1;
  }

  int gcd(int a, int b) {
    while (b != 0) {
      final temp = b;
      b = a % b;
      a = temp;
    }
    return a;
  }

  void selectNumber(int number) {
    state = NumberState(selectedNumber: number);
  }

  void clearSelection() {
    state = const NumberState();
  }

}
