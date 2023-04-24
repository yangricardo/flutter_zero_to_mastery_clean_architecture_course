import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/pages/task/task_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.settings_rounded,
    name: 'settings',
    child: SettingsPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.push(TaskPage.pageConfig.name);
                  }
                },
                child: const Text('Go Back'))
          ],
        ));
  }
}
