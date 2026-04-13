import 'package:calculator_bloc/calculator_bloc.dart';
import 'package:calculator_bloc/calculator_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp( MyApp());
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
         
          home:BlocProvider(
            create:(_)=> CalculatorBloc(),
            child:CalculatorPage(),
          )
        );
      },
    );
  }
}

class CalculatorPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              
            )
          ],
        )
        ),
     );
    }
}
