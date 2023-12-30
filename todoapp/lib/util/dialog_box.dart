// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {

final controller;
VoidCallback OnSave;
VoidCallback OnCancel;

 DialogBox({
  super.key, 
  required this.controller, 
  required this.OnSave, 
  required this.OnCancel, 
});



  @override
  Widget build(BuildContext context) {
    return   AlertDialog(
      backgroundColor: Colors.grey[200],
      content:  SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
             TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(), 
                hintText: 'Add a new task', 
                ),         
            ),

              //buttons = save + cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //save buton
                  MyButton(text: 'Save', onPressed: OnSave,),

                  const SizedBox(width: 10), 
                  // cancel buton
                  MyButton(text: 'cancel', onPressed: OnCancel,),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
