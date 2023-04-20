import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartView extends StatelessWidget {
  // final Function onPressedGoToSettings;
  const StartView({
    super.key,
    // required this.onPressedGoToSettings
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: ElevatedButton(
          onPressed: () {
            context.push('/home/settings');
            // onPressedGoToSettings();
          },
          child: const Text('Go to Settings'),
        ));
  }
}
