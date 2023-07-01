import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function (bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.circular(12),
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
              )
            ]
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}
