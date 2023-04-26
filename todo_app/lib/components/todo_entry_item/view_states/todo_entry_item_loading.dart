import 'package:flutter/material.dart';
import 'package:todo_app/core/skeleton_loading.dart';

class ToDoEntryItemLoading extends StatelessWidget {
  const ToDoEntryItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(title: SkeletonLoading());
  }
}
