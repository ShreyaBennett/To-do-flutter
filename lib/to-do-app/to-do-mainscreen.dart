import 'package:flutter/material.dart';
import 'package:to_do_flutter/helpers/colorTheme.dart';
import 'package:to_do_flutter/to-do-app/todo2.dart';
import 'package:to_do_flutter/to-do-app/to-do-dialogbox.dart';
import 'dart:math';
class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<StatefulWidget> createState() => ToDoListState();
}

class ToDoListState extends State<ToDoList> {

//motivational quotes
  final List<String> motivationalQuotes = [
    "Small steps, big progress!",
    "One task at a time, keep going!",
    "Every tick mark is a win!",
    "Consistency is key to success!",
    "Stay focused, stay strong!",
    "Your future self will thank you!",
    "Turn goals into habits!",
    "Make today productive!",
    "Never stop, keep going",
    "Take action, not excuses",
    "Every small step forward is still moving you ahead",
    "Success is built one productive day at a time",
    "Your dreams don't care if you're tired today",
    "Push yourself because no one else will do it",

  ];


  //text Controller
  final _controller = TextEditingController();
  List listItems = [
    ["One of the feature is slidable deletion and editing the task.Try it!",false],
    ["Drink Water.",false],
    
  ];
 
 String selectedQuote = "";


  void _onCheckboxChanged(bool ?value,int index) {    //checkbox
    setState(() {
      listItems[index][1]=!listItems[index][1];
    });
  }

  void createNewTask(){
    showDialog(
    context: context,
     builder: (context){
      return toDoDialogBox(
        controller: _controller,
        onSave: saveNewTask,
      //  onCancel: ()=> Navigator.of(context).pop,
      );
     },
     );
     }

void saveNewTask(){                           //saving
  setState(() {
    listItems.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
}

void deleteTask(int index){                 //deletion
  setState(() {
    listItems.removeAt(index);
  });
}

void editTask(int index){                           //editing
  TextEditingController editController = TextEditingController();
  editController.text = listItems[index][0];

  showDialog(
    context: context,
   builder: (context){
    return AlertDialog(
      title: Text("Edit Text"),
      content: TextField(
        controller: editController,
        decoration: InputDecoration(hintText:"Enter edit text"),
      
      ),
      actions: [
        MaterialButton(
          color: ColorTheme.SaveButton
          ,
          onPressed: (){
            setState(() {
              listItems[index][0]= editController.text;
            });
            Navigator.pop(context);
          },
          child:Text("Save",
          style: TextStyle(color: ColorTheme.customWhite),),
         ),
        MaterialButton(
          color: ColorTheme.CancelButton,
          onPressed: ()=> Navigator.pop(context),
         child: Text("Cancel",
         style: TextStyle(color: ColorTheme.customWhite),),
         ),
         
      ],
    );
   });
}
void getNewQuote(){                         //quotes
  final random = Random();
  setState(() {
    selectedQuote= motivationalQuotes[random.nextInt(motivationalQuotes.length)];
  });
}
 @override
 void initState(){
  super.initState();
  getNewQuote();
 }
Widget build(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: createNewTask,
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: const Icon(Icons.add),
    ),
    backgroundColor: ColorTheme.customGrey,
   appBar: AppBar(
  elevation: 0.0,
  centerTitle: true,
  backgroundColor: ColorTheme.AppbarBg,
  title: FittedBox(
    fit: BoxFit.scaleDown, 
    child: Text(
      selectedQuote,
      
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ColorTheme.customBlack, 
        fontSize: 20, 
        fontFamily: 'Lobster',
        // fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

    body: RefreshIndicator(
      onRefresh: () async{
        getNewQuote();
      },
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,  
          height: MediaQuery.of(context).size.height * 0.7, 
          padding: const EdgeInsets.all(16),  
          decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 222, 210, 210),
            color: ColorTheme.ContainerBg,
            borderRadius: BorderRadius.circular(20.0), 
            boxShadow: [
              BoxShadow(
                color: ColorTheme.customBlack,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                "Achieve Your Tasks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10), 
              Expanded(
                child: ListView.builder(
                  itemCount: listItems.length,
                  itemBuilder: (context, index) {
                    return todo2(
                      NameTask: listItems[index][0],
                      taskCompleted: listItems[index][1],
                      onChanged: (value) => _onCheckboxChanged(value, index),
                      deleteFunction: (context) => deleteTask(index),
                      editFunction: (context)=>editTask(index),

                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}