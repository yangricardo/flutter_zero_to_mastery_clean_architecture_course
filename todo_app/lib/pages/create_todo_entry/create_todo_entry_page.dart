import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/pages/create_todo_entry/cubit/create_todo_entry_page_cubit.dart';

class CreateTodoEntryPageProvider extends StatelessWidget {
  final CollectionId collectionId;
  const CreateTodoEntryPageProvider({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTodoEntryPageCubit>(
      create: (context) => CreateTodoEntryPageCubit(
        collectionId: collectionId,
      ),
      child: const CreateTodoEntryPage(),
    );
  }
}

class CreateTodoEntryPage extends StatelessWidget {
  const CreateTodoEntryPage({super.key});

  static const PageConfig pageConfig =
      PageConfig(icon: Icons.add_task_rounded, name: 'create_todo_entry');

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          ),
        ));
  }
}
