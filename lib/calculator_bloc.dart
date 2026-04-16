import 'package:calculator_bloc/calculator_event.dart';
import 'package:calculator_bloc/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState(userInput: '', result: '0')) {
    on<ButtonPressed>(_onButtonPressed);
  }
  void _onButtonPressed(ButtonPressed event, Emitter<CalculatorState> emit) {
    String userInput = state.userInput;
    String result = state.result;

    if (event.value == 'AC') {
      userInput = '';
      result = '0';
    } else if (event.value == '=') {
      result = _calculate(userInput);
    } else if (event.value == '+/-') {
      if (userInput.isNotEmpty) {
        if (userInput.startsWith('-')) {
          userInput = userInput.substring(1);
        } else {
          userInput = '-$userInput';
        }
      }
    } else if (event.value == 'backspace') {
      if (userInput.isNotEmpty) {
        userInput = userInput.substring(0, userInput.length - 1);
      }
    } else {
      userInput += event.value;
    }
    emit(state.copyWith(userInput: userInput, result: result));
  }

  String _calculate(String input) {
    try {
      String finalInput = input.replaceAll('X', '*');
      finalInput = finalInput.replaceAllMapped(
        RegExp(r'(\d+(\.\d+)?)%(\d+(\.\d+)?)'),
        (match) {
          double first = double.parse(match[1]!);
          double second = double.parse(match[3]!);

          double result = (first * second) / 100;

          return result.toString();
        },
      );
      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }
}
