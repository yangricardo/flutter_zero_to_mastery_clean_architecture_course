import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/home/start');
                // onPressedGoToSettings();
              },
              child: const Text('Go Back'),
            )
          ],
        ));
  }
}
