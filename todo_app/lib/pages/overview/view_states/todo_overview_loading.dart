import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ToDoOverviewLoading extends StatelessWidget {
  const ToDoOverviewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        color: Colors.grey[50],
      ),
    );
  }
}
