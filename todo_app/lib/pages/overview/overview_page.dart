import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/page_config.dart';
import 'package:todo_app/domain/use_cases/load_todo_collection.dart';
import 'package:todo_app/pages/overview/cubit/todo_overview_cubit.dart';

class OverviewPageProvider extends StatelessWidget {
  const OverviewPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoOverviewCubit(
          loadToDoCollections: LoadToDoCollections(
              todoRepository: RepositoryProvider.of(context))),
      child: const OverviewPage(),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.work_history_rounded,
    name: 'overview',
    child: OverviewPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text('Overview'),
      ],
    );
  }
}
