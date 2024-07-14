import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todo extends StatefulWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  Todo(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), 
        children: [
          SlidableAction(
            onPressed:widget.deleteFunction,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(15),
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple,
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                  value: widget.taskcompleted,
                  onChanged: widget.onChanged,
                  checkColor: Colors.black,
                  side: BorderSide(color: Colors.white),
                ),
                Text(
                  widget.taskname,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: widget.taskcompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.white,
                      decorationThickness: 5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
