import 'package:calculator_bloc/calculator_bloc.dart';
import 'package:calculator_bloc/calculator_event.dart';
import 'package:calculator_bloc/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> buttons = [
      'AC',
      '+/-',
      '%',
      '/',
      '7',
      '8',
      '9',
      'X',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '⌫',
      '0',
      '.',
      '=',
    ];
    Color getColor(String text) {
      if (text == 'AC' || text == '+/-' || text == '%') {
        return Colors.grey;
      } else if ('/X-+='.contains(text)) {
        return Colors.orange;
      } else {
        return Colors.grey.shade800;
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocBuilder<CalculatorBloc, CalculatorState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: 0.35.sh,
                  width: double.infinity,
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 80.h),
                        child: Row(
                          children: [Icon(Icons.menu, color: Colors.orange)],
                        ),
                      ),
                      Text(
                        state.userInput,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 40.sp,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        state.result,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 40.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.all(10.w),
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                    itemBuilder: (context, index) {
                      final text = buttons[index];

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: getColor(text),
                        ),
                        onPressed: () {
                          if (text == '⌫') {
                            context.read<CalculatorBloc>().add(
                              ButtonPressed('backspace'),
                            );
                          } else {
                            context.read<CalculatorBloc>().add(
                              ButtonPressed(text),
                            );
                          }
                        },
                        child:
                            text == '⌫'
                                ?  Icon(
                                  Icons.backspace,
                                  color: Colors.white,size: 30.sp,
                                )
                                : Text(
                                  text,
                                  style: TextStyle(
                                    fontSize: 35.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
