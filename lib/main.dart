import 'package:calculator_bloc/calculator_bloc.dart';
import 'package:calculator_bloc/calculator_event.dart';
import 'package:calculator_bloc/calculator_state.dart';
import 'package:calculator_bloc/calculator_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 596),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          home: BlocProvider(
            create: (_) => CalculatorBloc(),
            child: CalculatorPage(),
          ),
        );
      },
    );
  }
}

// class CalculatorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final List<String> buttons = [
//       'AC',
//       '+/-',
//       '%',
//       '/',
//       '7',
//       '8',
//       '9',
//       'X',
//       '4',
//       '5',
//       '6',
//       '-',
//       '1',
//       '2',
//       '3',
//       '+',
//       '0',
//       '.',
//       '=',
//     ];
//     Color getColor(String text) {
//   if (text == 'AC' || text == '+/-' || text == '%') {
//     return Colors.grey;
//   } 
//   else if ('/X-+=' .contains(text)) {
//     return Colors.orange;
//   } 
//   else {
//     return Colors.grey.shade800;
//   }
// }
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: BlocBuilder<CalculatorBloc, CalculatorState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 Container(
//                   height: 350.h,
//                   width: double.infinity,
//                   color: Colors.black,
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   alignment: Alignment.bottomRight,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 120.h),
//                         child: Row(
//                           children: [Icon(Icons.menu, color: Colors.orange)],
//                         ),
//                       ),
//                       Text(
//                         state.userInput,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 21.sp,
//                         ),
//                       ),
//                       SizedBox(height: 10.h),
//                       Text(
//                         state.result,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 21.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     padding: EdgeInsets.all(10.w),
//                     itemCount: buttons.length,
//                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 4,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                     ), 
//                     itemBuilder: (context,index) {
//                       final text = buttons[index];
//                       return ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           shape: const CircleBorder(),
//                           backgroundColor: getColor(text),
//                         ),
//                         onPressed: () {
//                           context.read<CalculatorBloc>().add(ButtonPressed(text));
//                         },
//                        child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 22.sp,
//             color: Colors.white,
//             fontWeight: FontWeight.w500,
//           ),
//                        )
//                          );
//                     }
//                     ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
