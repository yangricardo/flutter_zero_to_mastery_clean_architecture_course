import 'package:flutter/material.dart';
import 'package:todo_app/core/page_config.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.settings_rounded,
    name: 'overview',
    child: SettingsPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
