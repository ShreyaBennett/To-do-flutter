import 'package:flutter/material.dart';
import 'package:to_do_flutter/helpers/colorTheme.dart';

class MyButton extends StatelessWidget {
  final VoidCallback ? onPressed;
  final String text;

  MyButton({ this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
          onPressed: onPressed,
          color: ColorTheme.SaveButton,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Text(
            text,
            style: TextStyle(color: ColorTheme.customWhite,
            // backgroundColor:ColorTheme.SaveButton 
            ),
          ),
          ),
        
      
    );
  }
}
