import 'package:flutter/material.dart';
import 'package:todo_app/core/page_config.dart';

class CreateTodoEntryPageProvider extends StatelessWidget {
  const CreateTodoEntryPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateTodoEntryPage();
  }
}

class CreateTodoEntryPage extends StatelessWidget {
  const CreateTodoEntryPage({super.key});

  static const PageConfig pageConfig = PageConfig(
      icon: Icons.add_task_rounded,
      name: 'create_todo_entry',
      child: CreateTodoEntryPageProvider());

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(),
        ));
  }
}
