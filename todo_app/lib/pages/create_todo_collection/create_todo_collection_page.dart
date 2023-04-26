import 'package:flutter/material.dart';
import 'package:todo_app/core/page_config.dart';

class CreateTodoCollectionPage extends StatefulWidget {
  const CreateTodoCollectionPage({super.key});
  static const pageConfig = PageConfig(
      icon: Icons.add_task_rounded,
      name: 'create_todo_collection',
      child: CreateTodoCollectionPage());
  @override
  State<CreateTodoCollectionPage> createState() =>
      _CreateTodoCollectionPageState();
}

class _CreateTodoCollectionPageState extends State<CreateTodoCollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
