import 'package:flutter/material.dart';

import 'package:to_do_flutter/to-do-app/to-do-splashscreen.dart';
//import 'package:to_do_flutter/to-do-app/to-do-mainscreen.dart';


void main() => runApp(MyFlutterApp());

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do-App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      
   home:
   SplashScreen(),
   //ToDoList()
     
    );
  
  }
}
//}
