// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: camel_case_types, must_be_immutable
class toDoTile extends StatelessWidget {

final String taskName;
final bool taskCompLeted;
Function(bool?)? onChanged;
Function(BuildContext)? deleteFunction;



  toDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompLeted,
    required this.onChanged,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(   // 5 aşama 
        endActionPane: ActionPane(
          motion: const StretchMotion(),
           children: [
           SlidableAction(
          onPressed: deleteFunction, 
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(10),
          ), 
           ], 
          ),
        child: Container(
          padding:  const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey, 
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompLeted,
                onChanged: onChanged, 
                activeColor: Colors.black,
               ), 
           
              Text(taskName,
               style:  TextStyle(
                decoration: taskCompLeted
                ? TextDecoration.lineThrough 
                : TextDecoration.none
                ),
               ), 
            ],
          ),
          ),
      ),
      );
  
  }
}
