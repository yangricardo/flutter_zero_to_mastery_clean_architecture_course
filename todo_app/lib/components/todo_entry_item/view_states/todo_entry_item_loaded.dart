import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';

class ToDoEntryItemLoaded extends StatelessWidget {
  final ToDoEntry entryItem;
  final Function(bool?) onChanged;

  const ToDoEntryItemLoaded({
    super.key,
    required this.entryItem,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(entryItem.description),
      value: entryItem.isDone,
      onChanged: onChanged,
    );
  }
}
