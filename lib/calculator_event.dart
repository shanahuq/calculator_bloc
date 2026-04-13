abstract class CalculatorEvent {}
class ButtonPressed extends CalculatorEvent{
  final String value;
  ButtonPressed(this.value);
}