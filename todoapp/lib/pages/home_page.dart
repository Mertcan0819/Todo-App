import 'package:flutter/material.dart';

import '../util/dialog_box.dart';
import '../util/too_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //t4xt controller
  final _controller = TextEditingController();


// list of todo tasks // 1 aşama 
List toDoList = [
['Mert Ali Can', false],
['can can can', false], 
];

// checkbox wass tapped // 2 aşama 
void checkBoxChanged(bool? value, int index) {
  setState(() {
    toDoList[index][1] = ! toDoList[index] [1];
  });
}




// save new task // 4 aşama 
void saveNewTask() {
  setState(() {
    toDoList.add([ _controller.text, false]);  
    _controller.clear();
  });
  Navigator.of(context).pop();
}

// create a new task // 3 aşama 
void creatNewTask() {
  showDialog(context: context, builder: (context) {
    return  DialogBox(
      controller: _controller ,
       OnSave: saveNewTask,
        OnCancel: () => Navigator.of(context).pop(),
        );
  },);
}

// delete task // 5 aşama 
void deleteTask(int index) {
 setState(() {
   toDoList.removeAt(index);
 }); 
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true,
        elevation: 0,

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: creatNewTask,
        child: const Icon(Icons.add), 
        ),


      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return toDoTile(
            taskName: toDoList[index] [0],
            taskCompLeted: toDoList[index] [1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}