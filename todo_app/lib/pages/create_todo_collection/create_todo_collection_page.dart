import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/domain/entities/todo_color_entity.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/domain/use_cases/create_todo_collection.dart';
import 'package:todo_app/pages/create_todo_collection/cubit/create_todo_collection_page_cubit.dart';

class CreateTodoCollectionPageProvider extends StatelessWidget {
  const CreateTodoCollectionPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTodoCollectionPageCubit>(
      create: (context) => CreateTodoCollectionPageCubit(
        createToDoCollection: CreateTodoCollection(
          todoRepository: RepositoryProvider.of<TodoRepository>(context),
        ),
      ),
      child: const CreateTodoCollectionPage(),
    );
  }
}

class CreateTodoCollectionPage extends StatefulWidget {
  const CreateTodoCollectionPage({super.key});
  static const pageConfig = PageConfig(
      icon: Icons.add_task_rounded,
      name: 'create_todo_collection',
      child: CreateTodoCollectionPageProvider());
  @override
  State<CreateTodoCollectionPage> createState() =>
      _CreateTodoCollectionPageState();
}

class _CreateTodoCollectionPageState extends State<CreateTodoCollectionPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTodoCollectionPageCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: cubit.titleChanged,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Color'),
                onChanged: cubit.colorChanged,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    final parsedColorIndex = int.tryParse(value);
                    if (parsedColorIndex == null ||
                        parsedColorIndex < 0 ||
                        parsedColorIndex > ToDoColor.predefinedColors.length) {
                      return 'Only numbers between 0 and ${ToDoColor.predefinedColors.length - 1} are allowed';
                    }
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final isValid = _formKey.currentState?.validate();
                  if (isValid == true) {
                    cubit.submit().then((_) => context.pop(true));
                  }
                },
                child: const Text('Save Collection'),
              ),
            ],
          )),
    );
  }
}
