import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_flutter/helpers/colorTheme.dart';

class todo2 extends StatelessWidget {
  final String NameTask;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;

  todo2({
    super.key,
    required this.NameTask,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 12.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: ColorTheme.DeletionBg,
              borderRadius: BorderRadius.circular(50.0),
            ),
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.edit,
              backgroundColor: Colors.blueAccent,
              borderRadius: BorderRadius.circular(50.0),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: taskCompleted
                  ? [Colors.grey.shade400, Colors.grey.shade600]
                  : [ColorTheme.customYellow, ColorTheme.customPurple],
            ),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: ColorTheme.customPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  NameTask,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: taskCompleted ? ColorTheme.customGrey : Colors.black,
                  ),
                ),
              ),
              // const SizedBox(width: 10.0),
              // IconButton(
              //   icon: Icon(Icons.edit, color: Colors.blueAccent),
              //   onPressed: () {
              //     editFunction!(context);
              //   },
              // ),
              // IconButton(
              //   icon: Icon(Icons.delete, color: Colors.red),
              //   onPressed: () {
              //     deleteFunction!(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget NameTextField() {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: TextField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      decoration: InputDecoration(
        hintText: "Enter your task",
        hintStyle: TextStyle(color: Colors.grey.shade600),
        filled: true,
        fillColor: ColorTheme.customWhite,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
    ),
  );
}
