import 'package:flutter/material.dart';
import 'package:to_do_flutter/to-do-app/toDo_Mybutton.dart';

class toDoDialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  //final VoidCallback onCancel;
  

  toDoDialogBox({
    super.key,
    required this.controller,
    required this.onSave,
   // required this.onCancel,
   
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      
      content: Container(
        height: 120.0,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add a New Task Now!",
                    labelText: "",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              MyButton(text: "Save", onPressed:onSave,),

             // MyButton(text: "Cancel", onPressed: onCancel)
            ],)
            ],
        ),
      ),
    );
  }
}
