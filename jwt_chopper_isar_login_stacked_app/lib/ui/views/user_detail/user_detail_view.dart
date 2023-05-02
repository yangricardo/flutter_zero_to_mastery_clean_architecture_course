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
    return viewModel.isBusy
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.purple[200]),
                  ),
                  const Text(
                    'Loading Users',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(title: Text("${viewModel.data?.name}")),
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${viewModel.data?.name}"),
                  const SizedBox(height: 10),
                  Text("Company: ${viewModel.data?.company}"),
                  const SizedBox(height: 10),
                  Text("Username: ${viewModel.data?.username}"),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
  }

  @override
  UserDetailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserDetailViewModel(index);
}
