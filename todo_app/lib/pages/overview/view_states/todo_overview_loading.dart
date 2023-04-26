import 'package:flutter/material.dart';
import 'package:todo_app/core/skeleton_loading.dart';

class ToDoOverviewLoading extends StatelessWidget {
  const ToDoOverviewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const SkeletonLoading();
  }
}
