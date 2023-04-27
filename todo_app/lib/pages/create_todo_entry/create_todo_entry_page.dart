import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/form_value.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';
import 'package:todo_app/domain/use_cases/create_todo_entry.dart';
import 'package:todo_app/pages/create_todo_entry/cubit/create_todo_entry_page_cubit.dart';

typedef ToDoEntryItemAddedCallback = Function();

class CreateTodoEntryPageExtra {
  final CollectionId collectionId;
  final ToDoEntryItemAddedCallback onToDoEntryItemAdded;

  CreateTodoEntryPageExtra(
      {required this.collectionId, required this.onToDoEntryItemAdded});
}

class CreateTodoEntryPageProvider extends StatelessWidget {
  final CollectionId collectionId;
  final ToDoEntryItemAddedCallback onToDoEntryItemAdded;
  const CreateTodoEntryPageProvider(
      {super.key,
      required this.collectionId,
      required this.onToDoEntryItemAdded});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTodoEntryPageCubit>(
      create: (context) => CreateTodoEntryPageCubit(
          collectionId: collectionId,
          addToDoEntry: CreateTodoEntry(
              todoRepository: RepositoryProvider.of<TodoRepository>(context))),
      child: CreateTodoEntryPage(onToDoEntryItemAdded: onToDoEntryItemAdded),
    );
  }
}

class CreateTodoEntryPage extends StatefulWidget {
  final ToDoEntryItemAddedCallback onToDoEntryItemAdded;

  const CreateTodoEntryPage({super.key, required this.onToDoEntryItemAdded});

  static const pageConfig = PageConfig(
    name: 'create_todo_entry',
    icon: Icons.add_rounded,
    child: Placeholder(),
  );

  @override
  State<CreateTodoEntryPage> createState() => _CreateTodoEntryPageState();
}

class _CreateTodoEntryPageState extends State<CreateTodoEntryPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateTodoEntryPageCubit>();
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (value) {
                  cubit.descriptionChanged(description: value);
                },
                validator: (value) {
                  final currentValidationState =
                      cubit.state.description?.validationStatus ??
                          ValidationStatus.pending;
                  switch (currentValidationState) {
                    case ValidationStatus.error:
                      return 'This field needs at least two characters to be valid';
                    case ValidationStatus.pending:
                    case ValidationStatus.success:
                      return null;
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  final isValid = _formKey.currentState?.validate();
                  if (isValid == null) {
                    cubit.submit();
                    widget.onToDoEntryItemAdded.call();
                    context.pop();
                  }
                },
                child: const Text('Save entry'),
              ),
            ],
          ),
        ));
  }
}
