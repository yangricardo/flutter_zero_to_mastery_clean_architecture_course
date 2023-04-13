import 'package:flutter/material.dart';

class ClassName extends StatelessWidget {
  final String message;
  const ClassName({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 40,
          color: Colors.redAccent,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          message,
          style: themeData.textTheme.bodySmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
