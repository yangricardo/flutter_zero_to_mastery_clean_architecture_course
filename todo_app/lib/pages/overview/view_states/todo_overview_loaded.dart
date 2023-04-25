import 'package:flutter/material.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';

class ToDoOverviewLoaded extends StatelessWidget {
  final List<ToDoCollection> collections;
  const ToDoOverviewLoaded({super.key, required this.collections});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        final colorScheme = Theme.of(context).colorScheme;
        return ListTile(
          tileColor: colorScheme.surface,
          selectedTileColor: colorScheme.surfaceVariant,
          iconColor: item.color.color,
          selectedColor: item.color.color,
          onTap: () => debugPrint(item.title),
          leading: const Icon(Icons.circle),
          title: Text(item.title),
        );
      },
    );
  }
}
