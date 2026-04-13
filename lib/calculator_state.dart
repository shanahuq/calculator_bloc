class CalculatorState {
  String userInput;
  String result;

  CalculatorState({this.userInput = '', this.result = '0'});

  // CalculatorState copyWith({String? userInput, String? result}) {
  //   return CalculatorState(
  //     userInput: userInput ?? this.userInput,
  //     result: result ?? this.result,
  //   );
  // }
}
