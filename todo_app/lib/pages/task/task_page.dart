import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/page_config.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({
    super.key,
  });

  static const pageConfig = PageConfig(
    icon: Icons.task_rounded,
    name: 'task',
    child: TaskPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.push('/home/dashboard');
              },
              child: const Text('Go to Dashboard'),
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
                    context.push('/home/overview');
                  }
                },
                child: const Text('Go Back'))
          ],
        ));
  }
}
