import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/pages/create_todo_collection/cubit/create_todo_collection_page_cubit.dart';

class CreateTodoCollectionPageProvider extends StatelessWidget {
  const CreateTodoCollectionPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateTodoCollectionPageCubit(),
      child: const CreateTodoCollectionPage(),
    );
  }
}

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
