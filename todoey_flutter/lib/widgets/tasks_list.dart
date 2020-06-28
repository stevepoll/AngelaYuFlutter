import 'package:flutter/material.dart';

import '../models/task.dart';

class TasksList extends StatefulWidget {
  TaskList list;
  Function updateListCount;

  TasksList(this.list, this.updateListCount);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    final tasks = widget.list.tasks;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(
          isChecked: task.isDone,
          taskTitle: task.name,
          checkboxChecked: (newValue) {
            widget.updateListCount();
            setState(() {
              task.toggleDone();
            });
          },
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxChecked;

  TaskTile({this.isChecked, this.taskTitle, this.checkboxChecked});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      activeColor: Colors.lightBlueAccent,
      value: isChecked,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      onChanged: checkboxChecked,
    );
  }
}
