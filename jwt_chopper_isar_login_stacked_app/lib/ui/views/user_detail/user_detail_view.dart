import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_detail_viewmodel.dart';

class UserDetailViewArguments {
  final int index;

  UserDetailViewArguments(this.index);
}

class UserDetailView extends StackedView<UserDetailViewModel> {
  final int index;
  const UserDetailView({Key? key, required this.index}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    UserDetailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(title: Text("${viewModel.data?.name}")),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Text("${viewModel.data?.name}"),
      ),
    );
  }

  @override
  UserDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserDetailViewModel(index);
}
