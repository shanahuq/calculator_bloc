class CalculatorState {
  final String userInput;
  final String result;

  CalculatorState({
    required this.userInput,
    required this.result,
  });

  CalculatorState copyWith({
    String? userInput,
    String? result,
  }) {
    return CalculatorState(
      userInput: userInput ?? this.userInput,
      result: result ?? this.result,
    );
  }
}
