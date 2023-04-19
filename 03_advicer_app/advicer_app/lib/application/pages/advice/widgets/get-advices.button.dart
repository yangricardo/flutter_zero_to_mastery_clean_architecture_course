import 'package:flutter/material.dart';

class GetAdvicesButton extends StatelessWidget {
  final Function() onTap;
  const GetAdvicesButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () {
        onTap.call();
      },
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: themeData.colorScheme.secondary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              'Get Advice',
              style: themeData.textTheme.headlineSmall,
            ),
          ),
        ),
      ),
    );
  }
}
