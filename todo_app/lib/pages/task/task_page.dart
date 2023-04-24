import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/pages/overview/overview_page.dart';
import 'package:todo_app/pages/settings/settings_page.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({
    super.key,
  });

  static const pageConfig = PageConfig(
    icon: Icons.task_rounded,
    name: 'tasks',
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
                context.pushNamed(SettingsPage.pageConfig.name);
              },
              child: const Text('Go to settings'),
            ),
            TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.pushNamed(OverviewPage.pageConfig.name);
                  }
                },
                child: const Text('Go Back'))
          ],
        ));
  }
}
