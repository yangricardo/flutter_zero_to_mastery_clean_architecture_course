import 'package:flutter/material.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';

class ToDoDetailPageProvider extends StatelessWidget {
  const ToDoDetailPageProvider({
    super.key,
    required this.collectionId,
  });

  final CollectionId collectionId;

  @override
  Widget build(BuildContext context) {
    return const ToDoDetailPage();
  }
}

class ToDoDetailPage extends StatelessWidget {
  const ToDoDetailPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: 'detail',
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
