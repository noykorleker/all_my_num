import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/number_provider.dart';

class InfiniteNumbersScreen extends ConsumerWidget {
  const InfiniteNumbersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNumber = ref.watch(numberProvider.select((state) => state.selectedNumber));
    final numberNotifier = ref.read(numberProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text("Infinite Scroll Grid")),
      body: GestureDetector(
        onTapUp: (_) {
          numberNotifier.clearSelection();
        },
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            int number = index + 1;
            bool isNumberPrime = numberNotifier.isPrime(number);
            bool isHighlighted = numberNotifier.isHighlighted(number);
            bool isSelected = selectedNumber == number;

            return GestureDetector(
              onTapDown: (_) => numberNotifier.selectNumber(number),
              onTapCancel: () => numberNotifier.clearSelection(),
              onTapUp: (_) => numberNotifier.clearSelection(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.blue
                      : isHighlighted
                      ? Colors.blueAccent
                      : isNumberPrime
                      ? Colors.red
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black12),
                ),
                child: Center(
                  child: Text(
                    "$number",
                    style: TextStyle(
                      color: isHighlighted || isNumberPrime || isSelected
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
