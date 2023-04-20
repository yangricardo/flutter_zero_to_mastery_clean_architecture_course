import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
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
                context.push('/home/settings');
              },
              child: const Text('Go to settings'),
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
