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
              },
              child: const Text('Go to start'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/home/task');
              },
              child: const Text('Go to task'),
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
