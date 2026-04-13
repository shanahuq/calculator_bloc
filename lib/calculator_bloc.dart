import 'package:calculator_bloc/calculator_event.dart';
import 'package:calculator_bloc/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorBloc extends Bloc<CalculatorEvent,CalculatorState>{
CalculatorBloc():super(CalculatorState(userInput : '',result: '0')) {
on<ButtonPressed>(_onButtonPressed);
}
void _onButtonPressed(
 ButtonPressed Event,Emitter<CalculatorState> emit
){
  String userInput = state.userInput;
  String result = state.result;

  if (event.value == 'AC') {
userInput ='';
result='0';
  }
  else if (event.value == '=') {
    result =_calculate(userInput);
  }
  else if (event.valu == '+/-') {
    if (userInput.isNotEmpty) {
      if (userInput.startsWith('-')) {
        userInput =userInput.substring(1);
      }
    }
  }
      else {
      userInput += event.value; 
      }
      emit (state.copyWith(userInput: userInput,result: result));
    }
    String -calculate(String input) {
      try {
        String finalInput = input.replaceAll('X', '*');
        parser p = parser();
        Expression exp = p.parse(finalInput);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(Evaluationtype.REAl,cm);

        return eval.toString();
      }
      catch(e) {
        return 'Error';
      }
    }
  }

