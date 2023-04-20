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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/home/settings');
                // onPressedGoToSettings();
              },
              child: const Text('Go to Settings'),
            ),
            TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.push('/home/start');
                  }
                },
                child: const Text('Go Back'))
          ],
        ));
  }
}
