import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
        color: Theme.of(context).colorScheme.onBackground,
        child: const Center(
          child: Text('Loading...'),
        ));
  }
}
