import 'package:aarog/screens/form_result.dart';
import 'package:flutter/material.dart';
import 'package:aarog/screens/home.dart';
import 'package:aarog/screens/gender.dart';
import 'package:aarog/screens/form.dart';
import 'package:aarog/bmi/input_page.dart';
import 'package:aarog/screens/period_tracker.dart';
import 'package:aarog/screens/reg_screen.dart';
import 'package:aarog/screens/login_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Home(),
        '/gender':(context)=>Gender(),
        '/form':(context)=>MyForm(),
        '/bmi':(context)=>InputPage(),
        '/period':(context)=>HomePage(),
        '/reg':(context)=>RegistrationScreen(),
        '/login':(context)=>LoginScreen(),
        '/menu':(context)=>Result(),
      },
    );
  }
}
