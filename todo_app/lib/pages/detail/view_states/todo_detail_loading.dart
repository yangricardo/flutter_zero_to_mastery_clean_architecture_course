import 'package:flutter/material.dart';
import 'package:todo_app/core/skeleton_loading.dart';

class ToDoDetailLoading extends StatelessWidget {
  const ToDoDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonLoading();
  }
}
