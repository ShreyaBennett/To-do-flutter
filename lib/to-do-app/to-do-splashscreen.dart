import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:to_do_flutter/to-do-app/to-do-mainscreen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    

    return AnimatedSplashScreen(
      duration: 5000,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Flexible(
            child: Container(
              // width: 500.0, 
              // height: 500.0, 
              width: MediaQuery.of(context).size.width * 0.9,  
              height: MediaQuery.of(context).size.height * 0.7,
              child: Lottie.asset(
                'assets/todo_animation.json', 
                repeat: true,
                fit: BoxFit.cover, 
              ),
            ),
          ),
          // const SizedBox(height: 10.0), 
          Text(
              "Plant your tasks, grow your achievements",
              style: TextStyle(
                fontSize: 20, 
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
      nextScreen: const ToDoList(), 
      splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.black,
    );
  }
}
